import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timbu_shop2/controllers/home.dart';
import 'package:timbu_shop2/utils/colors.dart';
import 'package:timbu_shop2/views/screens/cart.dart';
import 'package:timbu_shop2/views/component/build_navar_item.dart';
import 'package:timbu_shop2/views/screens/product_list.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key, required this.body, this.showBackArrow = false, this.title,  this.bottomNav});
  final Widget body;
  final bool showBackArrow;
  final String? title;
  final Widget? bottomNav;


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
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
        //   ),
        //   leadingWidth: showBackArrow ? 48.w : 123.w,
        // ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 11.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: showBackArrow
                              ? Image.asset('assets/icons/arrow-left.png',width: 24.w,)
                              : Image.asset(
                            'assets/images/logo.png',
                            height: 31.h,
                          )),
                    ),
                    Expanded(
                      child: Text(
                        title ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                      ),
                    ),
                    Expanded(child: SizedBox())
                  ],),
              ),
              SizedBox(height: 30.h,),
              Expanded(child: body),
            ],
          ),
        ),
        bottomNavigationBar: bottomNav,

      );
    },);
  }
}


