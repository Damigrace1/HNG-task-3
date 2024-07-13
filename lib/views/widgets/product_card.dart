import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timbu_shop2/controllers/cart.dart';
import 'package:timbu_shop2/utils/extensions.dart';

import '../../models/item.dart';
import '../../models/product/product.dart';
import '../../utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});
  static final CartController controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: Container(
        width: 185.w,
        margin: EdgeInsets.only(right: 13.w),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 184.h,
                width: double.infinity,
      
                child:
                CachedNetworkImage(
                  imageUrl: product.photos?.firstOrNull?.link ?? '',
                  fit: BoxFit.contain,
                  width: 140.w,
                  height: 140.w,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2,)),
                  ),
                  errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
                ),
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(5.r)
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              product.name??'',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              product.description??'',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16.92.sp,
                );
              }),
            ),
            SizedBox(height: 13.h),
            Text(
              'N 11,250',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(

              onPressed: () {
                Item? item = controller.cartItems.firstWhereOrNull((item) => item.product == product);
              if(item == null ){
                controller.cartItems.add(Item(product: product,quantity: 1));
                Get.snackbar('Success', 'Item added to cart',backgroundColor: AppColors.primary.withOpacity(0.8),
                duration: Duration(seconds: 1));
              }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 11.08.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}