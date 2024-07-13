import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbu_shop2/app_scaffold.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/cofetti.png')
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 42.h,),
          Align(
              alignment: Alignment.center,
              child: Text('Payment Successful',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22.sp),)),
          SizedBox(height: 255.h,),
          Center(child: Image.asset('assets/images/check.png',width: 92.h,)),
          SizedBox(height: 13.h,),
          Align(
              alignment: Alignment.center,
              child: Text('Payment Successful',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),)),
          SizedBox(height: 13.h,),
          Align(
              alignment: Alignment.center,
              child: Text('Thanks for your purchase',
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp),)),
        ],
      ),
    ),

    );
  }
}
