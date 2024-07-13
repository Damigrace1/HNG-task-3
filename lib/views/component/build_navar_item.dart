import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/home.dart';
import '../../utils/colors.dart';

class BuildNavBarItem extends StatelessWidget {
  const BuildNavBarItem({
    super.key, required this.id, required this.image,
  });
  final int id;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController controller) {
      return InkWell(
        splashColor: Colors.transparent,
        onTap: (){
          Get.find<HomeController>().changeTab(id);
          print(Get.find<HomeController>().selectedTab);
        },
        child: CircleAvatar(

          radius: 17,
          backgroundColor: Get.find<HomeController>().selectedTab == id ?
          AppColors.primary : AppColors.black,
          child: Center(
            child: Image.asset(
              color: Get.find<HomeController>().selectedTab == id ? AppColors.black : AppColors.white,
              image,
              width: 24.w,
            ),
          ), ),
      );
    },

    );

  }
}