import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timbu_shop2/app_scaffold.dart';
import 'package:timbu_shop2/utils/colors.dart';

import '../../controllers/cart.dart';
import '../../models/product/product.dart';
import '../../repo/product.dart';
import '../component/indicator.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>  {
  late List<Product> products;
  bool fetching = true;
  getProducts() async {
    
    products = await ProductRepo.getProducts();
    setState(() {
      fetching = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Get.put(CartController());
    getProducts();
    super.initState();
  }
 int techPage = 0;
 int menPage = 0;
 int womenPage = 0;

 int roundUpNum(int input){
   int output = input;
   if(input % 2 != 0)
     {
       output += 1;
     }
   return (output/2).toInt();
 }
  @override
  Widget build(BuildContext context) {
    return fetching
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : AppScaffold(
            title: "Product List",
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 33.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset('assets/images/home_Img.png')),
                      Positioned(
                        top: 73.h,
                        left: 26.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Premium Sound,\nPremium Savings',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  height: 28 / 20),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              'Limited offer, hope on and get yours now',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Text(
                    'Tech Gagdet',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 386.92.h,
                    child: PageView(
                      onPageChanged: (i){
                        setState(() {
                          techPage = i;
                        });
                      },
                      children:List.generate(roundUpNum(products.length),
                              (index) =>  Row(
                        children: [
                          ProductCard(
                            product: products[index],
                          ),
                          ProductCard(
                            product: products[index + 2],
                          ),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(roundUpNum(products.length),
                            (index) => Indicator(page: techPage, id: index)),
                  ),
                  SizedBox(
                    height: 67.h,
                  ),
                  Text(
                    'Men\'s Fashion',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 386.92.h,
                    child: PageView(
                      onPageChanged: (i){
                        setState(() {
                          menPage = i;
                        });
                      },
                      children:List.generate(roundUpNum(products.length),
                              (index) =>  Row(
                            children: [
                              ProductCard(
                                product: products[index],
                              ),
                              ProductCard(
                                product: products[index + 2],
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(roundUpNum(products.length),
                            (index) => Indicator(page: menPage, id: index)),
                  ),
                  SizedBox(
                    height: 67.h,
                  ),
                  Text(
                    'Men\'s Fashion',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 386.92.h,
                    child: PageView(
                      onPageChanged: (i){
                        setState(() {
                          womenPage = i;
                        });
                      },
                      children:List.generate(roundUpNum(products.length),
                              (index) =>  Row(
                            children: [
                              ProductCard(
                                product: products[index],
                              ),
                              ProductCard(
                                product: products[index + 2],
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(roundUpNum(products.length),
                            (index) => Indicator(page: womenPage, id: index)),
                  )
                ],
              ),
            ));
  }
}

