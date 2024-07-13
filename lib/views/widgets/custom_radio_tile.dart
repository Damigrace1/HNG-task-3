import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbu_shop2/utils/colors.dart';


class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 20.h,
        width: 20.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: value == groupValue
                ? AppColors.primary : AppColors.grey,
          ),
        ),
        child: Container(
          height: 8.h,
          width: 8.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value == groupValue
                ?AppColors.primary
                : null,
          ),
        )
    );
  }
}

class CustomRadioTile<T> extends StatefulWidget {
  const CustomRadioTile(
      this.title,
      this.value,
      this.groupVal, {
        Key? key,
        this.onTap,
        this.subtitle,
        this.leading,
      }) : super(key: key);
  final T groupVal;
  final String title;
  final T value;
  final Function()? onTap;
  final String? subtitle;
  final Widget? leading;
  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        splashColor: Colors.transparent,
        onTap: widget.onTap,
        child: Row(
          children: [
            CustomRadio(
              value: widget.value,
              groupValue: widget.groupVal,
            ),
            SizedBox(width: 19.w,),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.black),
            )
          ],
        ),
      );
      ListTile(
      onTap: widget.onTap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0.w,
      leading: widget.leading,
      subtitle: widget.subtitle != null
          ? Text(
        widget.subtitle!,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5)),
      )
          : null,
      title:
      CustomRadio(
        value: widget.value,
        groupValue: widget.groupVal,
      ),
      trailing: Text(
        widget.title,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.black),
      ),
    );
  }
}