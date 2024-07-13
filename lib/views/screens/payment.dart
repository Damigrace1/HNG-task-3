import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timbu_shop2/app_scaffold.dart';
import 'package:timbu_shop2/views/widgets/custom_radio_tile.dart';

import '../../controllers/cart.dart';
import '../../utils/colors.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  ValueNotifier<int> groupValue = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Payment',
      showBackArrow: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image.asset('assets/images/card.png',fit: BoxFit.fitWidth,),
         
            SizedBox(height: 34.h,),
            Text(
              'Card Number',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17.w),
                hintText: '0000 0000 0000 0000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 24.h),
           Row(
             children: [
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Expiry Date',
                       style: TextStyle(
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 12.h),
                     TextField(
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17.w),
                         hintText: '0000 0000 0000 0000',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8.0),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(width: 22.w,),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'CVV',
                       style: TextStyle(
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 12.h),
                     TextField(
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17.w),
                         hintText: '123',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8.0),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
            SizedBox(height: 62.33.h),

            Container(
              alignment: Alignment.center,
              child: SizedBox(

                width: 307.w,
                height: 44.h,
                child: ElevatedButton(

                  onPressed: () {
                    Get.find<CartController>().changeCheckoutStage(3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,color: AppColors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
