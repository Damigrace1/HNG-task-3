import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timbu_shop2/controllers/cart.dart';
import 'package:timbu_shop2/views/component/cart_item_card.dart';
import 'package:timbu_shop2/views/component/cart_item_details.dart';
import 'package:timbu_shop2/views/screens/checkout.dart';
import 'package:timbu_shop2/views/screens/payment.dart';
import 'package:timbu_shop2/views/screens/payment_success.dart';

import '../../app_scaffold.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(builder: (CartController controller) {
      return PopScope(
          canPop: false,
          onPopInvoked: (v){
            if(controller.checkoutStage > 0){
              controller.changeCheckoutStage(controller.checkoutStage - 1);
            }
            },
          child:
          controller. checkoutStage == 0 ?
          AppScaffold(
              title: "My Cart",
              body: GetBuilder<CartController>(builder: (CartController controller) {
                return controller.cartItems.isEmpty ?
                Center(child: Text('No Item in Cart',style:
                TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500),),) :
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return  CartItemCard(item: controller.cartItems[index],);
                        }, separatorBuilder: (context,_){
                      return SizedBox(height: 21.h,);
                    }, itemCount: controller.cartItems.length),
                    SizedBox(height: 31.h,),
                    CartItemDetails()
                  ],),
                );
              },)) :
          controller. checkoutStage == 1 ?
          CheckoutScreen() :
          controller. checkoutStage == 2 ?
              PaymentScreen() :
          PaymentSuccess());
    },

    );
  }
}
