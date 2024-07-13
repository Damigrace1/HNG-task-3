import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timbu_shop2/controllers/home.dart';
import 'package:timbu_shop2/utils/colors.dart';
import 'package:timbu_shop2/views/screens/cart0.dart';
import 'package:timbu_shop2/views/screens/cart.dart';
import 'package:timbu_shop2/views/component/build_navar_item.dart';
import 'package:timbu_shop2/views/screens/product_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
      {super.key,});



  static final _screens = [
    ProductListScreen(),
    CartScreen0(),
    CartScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeController>(builder: (HomeController controller) {
      return Scaffold(
        backgroundColor: AppColors.white,
        // appBar: AppBar(
        //   backgroundColor: AppColors.white,
        //   leading: Padding(
        //     padding: EdgeInsets.only(left: 24.w),
        //     child: showBackArrow
        //         ? Image.asset('assets/icons/arrow-left.png')
        //         : Image.asset(
        //       'assets/images/logo.png',
        //       height: 31.h,
        //     ),
        //   ),
        //   centerTitle: !showBackArrow,
        //   title: Text(
        //     title ?? '',
        //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
        //   ),
        //   leadingWidth: showBackArrow ? 48.w : 123.w,
        // ),
        body: _screens[controller.selectedTab],
        bottomNavigationBar: Container(
          height: 67.h,

          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r), color: AppColors.black),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildNavBarItem(id: 0,image: 'assets/icons/home.png',),
              BuildNavBarItem(id: 1,image: 'assets/icons/cart.png',),
              BuildNavBarItem(id: 2,image: 'assets/icons/checkout.png',),
            ],
          ),
        ),
      );
    },);
  }
}


