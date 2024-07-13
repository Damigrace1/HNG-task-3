import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.page, required this.id,
  });

  final int page;
  final int id;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 12.h,
      width: 12.h,
      margin: EdgeInsets.only(right: 14.w),
      decoration: BoxDecoration(
          shape:   BoxShape.circle,
          color: page == id ? AppColors.primary : AppColors.white,
          border: Border.all(color: page == id ? AppColors.primary : AppColors.grey,)
      ),
    );
  }
}