import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timbu_shop2/controllers/cart.dart';
import 'package:timbu_shop2/models/product/product.dart';
import 'package:timbu_shop2/utils/colors.dart';
import 'package:timbu_shop2/utils/extensions.dart';

import '../../models/item.dart';

class CartItemCard extends StatelessWidget {
  final Item item;

  const CartItemCard({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 29.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: item.product.photos?.firstOrNull?.link ?? '',
              fit: BoxFit.contain,
              width: 60.w,
              placeholder: (context, url) => const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: AppColors.black),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.product.description ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Quantity Selector
                  SizedBox(
                    width: 88.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              if (item.quantity! > 1) {
                                item.quantity = item.quantity! - 1;
                                Get.find<CartController>().update();
                              }
                            },
                            child: Image.asset(
                              'assets/icons/minus.png',
                              width: 20.w,
                            )),
                        Text(item.quantity
                            .toString()), // Update with actual quantity
                        InkWell(
                            onTap: () {
                              item.quantity = item.quantity! + 1;
                              Get.find<CartController>().update();
                            },
                            child: Image.asset(
                              'assets/icons/plus.png',
                              width: 20.w,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: (){
                  Get.find<CartController>().cartItems.removeWhere((e) =>
                  e.product == item.product);
                  Get.find<CartController>().update();
                },
                  child: Image.asset(
                    'assets/icons/delete.png',
                    width: 18.w,
                  ),
                ),
                Text(
                  'N ${item.product.current_price?.firstOrNull?.NGN?.firstOrNull}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
