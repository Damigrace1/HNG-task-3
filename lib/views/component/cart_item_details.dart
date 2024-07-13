import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timbu_shop2/controllers/cart.dart';
import 'package:timbu_shop2/utils/colors.dart';
import 'package:timbu_shop2/views/screens/checkout.dart';

import '../widgets/dashed_liner.dart';
import 'detail_row.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key});


  String getTotal(){
    double sum = 0;
    final items = Get.find<CartController>().cartItems;
    for (var item in items) {
       sum += (item.product.current_price?.firstOrNull?.NGN?.firstOrNull??0) * item.quantity;
    }
    return sum.toString();
  }
  static double  deliveryFee = 3000;
  static double  discount = 1000;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.67),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shopping Summary',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Text('Discount Code',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black.withOpacity(0.6353),
                  height: 17 / 14)),
          SizedBox(height: 17.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 41.18.h,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 36.w),
              SizedBox(
                height: 41.18.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 41.82.h),
          DetailRow(title: 'Sub-Total',value: getTotal(),),
          DetailRow(title: 'Delivery Fee',value: deliveryFee.toString(),),
          DetailRow(title: 'Discount Amount',value: discount.toString(),),
          SizedBox(height: 8.h,),
          Container(
            width: double.infinity,
            child: CustomPaint(
              painter: DashedLinePainter(),
            ),
          ),
          SizedBox(height: 23.h,),
          DetailRow(title: 'Total Amount',value: (double.parse(getTotal()) +
          discount + deliveryFee).toString(),),
          SizedBox(height: 36.h),
          Container(
            alignment: Alignment.center,
            child: SizedBox(

              width: 307.w,
              height: 44.h,
              child: ElevatedButton(

                onPressed: () {
                  Get.find<CartController>().changeCheckoutStage(1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 48.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,color: AppColors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


