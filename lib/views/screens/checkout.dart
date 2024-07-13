import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timbu_shop2/app_scaffold.dart';
import 'package:timbu_shop2/views/widgets/custom_radio_tile.dart';

import '../../controllers/cart.dart';
import '../../utils/colors.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  ValueNotifier<int> groupValue = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Checkout',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select how to receive your package(s)',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 21.h),

            // Pickup Section
            Text(
              'Pickup',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            ValueListenableBuilder<int>(
                valueListenable: groupValue,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      CustomRadioTile<int>(
                        'Sokoto Street, Area 1, Garki, Area 1 AMAC',
                        0,
                        value,
                        onTap: () {
                          groupValue.value = 0;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomRadioTile<int>(
                          'Sokoto Street, Area 1, Garki, Area 1 AMAC', 1, value,
                        onTap: () {
                          groupValue.value = 1;
                        },),
                    ],
                  );
                }),

            SizedBox(height: 35.h),

            // Delivery Section
            Text(
              'Delivery',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              'Contact',
              style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            ),

            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17.w),
                labelText: 'Phone no(s)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone no(s)',
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17.w),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 62.33.h),

            Container(
              alignment: Alignment.center,
              child: SizedBox(

                width: 307.w,
                height: 44.h,
                child: ElevatedButton(

                  onPressed: () {
                    Get.find<CartController>().changeCheckoutStage(2);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Go to Payment',
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
