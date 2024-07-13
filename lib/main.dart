import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:timbu_shop2/app_scaffold.dart';
import 'package:timbu_shop2/controllers/home.dart';

import 'package:timbu_shop2/utils/dio_provider.dart';
import 'package:timbu_shop2/app_shell.dart';
import 'package:timbu_shop2/views/screens/product_list.dart';

import 'utils/custom_interceptor.dart';

void main() {
  runApp(const MyApp());
  DioProvider().dio.interceptors.add(CustomInterceptor());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    final h = Get.put(HomeController());
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(428, 935),
      builder: (context, child) => GetMaterialApp(
        builder: (context, child) {
          return Overlay(
            initialEntries: [OverlayEntry(builder: (context) => child!)],
          );
        },
        title: 'Star Image',
        theme: ThemeData(
          fontFamily: 'Montserrat'
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}

