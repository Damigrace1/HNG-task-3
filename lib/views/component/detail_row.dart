import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key, required this.title, required this.value,
  });

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 12.sp,color: AppColors.black
                .withOpacity(0.8),fontWeight: FontWeight.w500),),
            Text('N $value',style: TextStyle(fontSize: 14.sp,color: AppColors.black
                .withOpacity(0.8),fontWeight: FontWeight.w600),)
          ],
        ),
        SizedBox(height: 17.h,)
      ],
    );
  }
}