<?php

namespace App\Http\Controllers;

use App\Models\Anonymus;
use App\Models\Cart;
use App\Models\OrderItems;
use App\Models\Orders;
use App\Models\User;
use Cashfree\Cashfree;
use Cashfree\Model\CustomerDetails;
use Cashfree\Model\OrderEntity;
use Cashfree\Model\OrderMeta;
use Exception;
use Illuminate\Http\Request;
use Cashfree\Model\CreateOrderRequest;
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
{
    public function createOrder(Request $request)
    {
        $cashfree = new Cashfree(0,"TEST10284318f45007527c473d39477181348201","cfsk_ma_test_0c6869d946184130107fc0cb23acbabc_4e020c8f","","","","");

        $x_api_version = "2025-01-01";

        $create_orders_request = new CreateOrderRequest();

        // $create_orders_request->setOrderAmount($request->);

        $create_orders_request->setOrderCurrency("INR");

        $customerDetails = new CustomerDetails();

        $userType=0; // For a registered user.

        $anonymusUser=null;

        if($request->get('user')){
            // In this case a user already exists. In this solution insertion in cart, insertion in order_items and orders table.

            // Step 1 is to get all the data from the cart inside here.

            // Step 2 insert data in orders table.

            // Step 3 insert data in order_items table.

            $pendingOrders = Orders::where('table_id',$request->get('user')['id'])->where('current_status',0)->first();

            if($pendingOrders){
                return(response()->json(['message'=>'Order payment cannot be done until previous orders are not confirmed'],402));
            }

            $customerDetails->setCustomerId("cashfree_" . $request->get('user')['id']);

            $customerDetails->setCustomerEmail($request->get('user')['email']);

            if($request->get('user')['phone']==null || $request->get('user')['address']==null || $request->get('user')['state']==null || $request->get('user')['zip']==null){
                return(response()->json(['message'=>'Redirect to profile'],302));
            }

            $customerDetails->setCustomerPhone($request->get('user')['phone']);

            // $userDetails = User::find('id',$request->get('user')['id'])->first();

            // if($userDetails->phone==null || $userDetails->address==null || $userDetails->state==null || $userDetails->zip){
            //     return(response()->json(['message'=>'Redirect to profile'])->setStatusCode(302));
            // }

            $cartItems = Cart::where('user_id',$request->get('user')['id'])->get();

            $formattedAmount = number_format((float)$request->totalAmount, 2, '.', '');

            $create_orders_request->setOrderAmount($formattedAmount);
        }
        else{
            $userType=1; // For registered user.

            // Create an anonymus user here no insertion in the cart only inside the order_items table and orders table.

            // Step 1 make an anonymus user.

            // Step 2 insert data in orders table.

            // Step 3 insert data in order_items table.

            $request->validate([
                'firstName' => 'required',
                'lastName' => 'required',
                'email' => 'required',
                'currentState' => 'required',
                'address' => 'required',
                'zip' => 'required',
                'state' => 'required',
                'phone' => 'required',
                'subtotal' => 'required',
            ]);

            $formattedAmount = number_format((float)$request->subtotal, 2, '.', '');

            $create_orders_request->setOrderAmount($formattedAmount);

            $products = $request->state;

            foreach ($products as $product) {
                if(!isset($product['id'])){
                    return(response()->json(['message'=>'Some error in the input']));
                }
            }

            // Fetch for email id first to create a new anonymus. If email does not exists then make

            $anonymusUserId = 0;

            $anonymusUser = DB::table('anonymus')->where('email',$request->email)->first();

            if($anonymusUser){
                $anonymusUserId = $anonymusUser->id;
            }
            else{
                $anonymusUserId = DB::table('anonymus')->insertGetId([
                    'first_name'=>$request->firstName,
                    'last_name' => $request->lastName,
                    'email' => $request->email,
                    'address'=> $request->address,
                    'address2' => $request->address2,
                    'state' => $request->currentState,
                    'zip' => $request->zip,
                    'phone' => $request->phone,
                ]);
            }

            $anonymusUser = Anonymus::find($anonymusUserId);

            $customerDetails->setCustomerId("cashfree_" . $anonymusUser->id);

            $customerDetails->setCustomerEmail($anonymusUser->email);

            $customerDetails->setCustomerPhone($anonymusUser->phone);
        }

        $create_orders_request->setCustomerDetails($customerDetails);

        try {
            $result = $cashfree->PGCreateOrder( $create_orders_request,$x_api_version);

            $data = [
                'order_id' => $result[0]->getOrderId(),
                'cf_order_id' => $result[0]->getCfOrderId(),
                'order_amount' => $result[0]->getOrderAmount(),
                'payment_session_id' => $result[0]->getPaymentSessionId(),
            ];

            if ($anonymusUser) {
                $data['table_name'] = 'anonymus';
                $data['table_id'] = $anonymusUser->id;
            } else {
                $data['table_name'] = 'users';
                $data['table_id'] = $request->get('user')['id'];
            }

            $order = Orders::create($data);

            if($userType==1){
                foreach ($products as $product) {
                    $orderItems = new OrderItems();

                    $orderItems->product_id=$product['id'];

                    $orderItems->count = $product['qty'];

                    $orderItems->order_id = $order->id;

                    $orderItems->cart_id=0;

                    OrderItems::create([
                        'product_id' => $orderItems->product_id,
                        'count' => $orderItems->count,
                        'order_id' => $orderItems->order_id,
                        'cart_id' => $orderItems->cart_id,
                    ]);
                }
            }
            else{
                foreach ($cartItems as $cartItem) {
                    $orderItems = new OrderItems();

                    $orderItems->product_id=$cartItem->product_id;

                    $orderItems->count = $cartItem->count;

                    $orderItems->order_id = $order->id;

                    $orderItems->cart_id=$cartItem->id;

                    OrderItems::create([
                        'product_id' => $orderItems->product_id,
                        'count' => $orderItems->count,
                        'order_id' => $orderItems->order_id,
                        'cart_id' => $orderItems->cart_id,
                    ]);
                }
            }

            return(response()->json(['data'=>$result[0]]));
        } catch (Exception $e) {
            echo 'Exception when calling PGCreateOrder: ', $e->getMessage(), PHP_EOL;
        }

    }

    public function processPendingOrders(Request $request){
        $cashfree = new Cashfree(0,"TEST10284318f45007527c473d39477181348201","cfsk_ma_test_0c6869d946184130107fc0cb23acbabc_4e020c8f","","","","");

        $x_api_version = "2025-01-01"; // $x_request_id.

        // 0 are pending orders.
        $orders = Orders::where('current_status',0)->where('table_id',$request->get('user')['id'])->get();

        // dd($orders);

        // SUCCESS
        // FAILED

        try {
            foreach ($orders as $order) {
                $result = $cashfree->PGOrderFetchPayments($order->order_id,$x_api_version);

                // dd(count($result[0]));

                if(count($result[0])==0){
                    Orders::where('id',$order->id)->update([
                        'current_status'=> -1,
                    ]);

                    return(response()->json(['message'=>'Order status updated']));
                }

                if($result[0][0]->getPaymentStatus()=="SUCCESS"){
                    Orders::where('id',$order->id)->update([
                        'current_status'=>1,
                    ]);
                }
                elseif($result[0][0]->getPaymentStatus()=="FAILED"){
                    Orders::where('id',$order->id)->update([
                        'current_status'=>-1,
                    ]);
                }

                if($order->table_name=="users"){
                    $orderItems = OrderItems::where('order_id',$order->id)->get();

                    foreach ($orderItems as $orderItem) {
                        $cartEntry = Cart::find($orderItem->cart_id);

                        if($cartEntry){
                            $cartEntry->delete();
                        }
                    }
                }
            }
        } catch (Exception $e) {
            echo 'Exception when calling PGCreateOrder: ', $e->getMessage(), PHP_EOL;
        }

        return(response()->json(['message'=>'Order status updated']));
    }

}
