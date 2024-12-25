import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;

  const SecondaryButton(
      {required this.onTap,
      required this.title,
      this.color,
      this.borderColor,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor ?? Colors.red, width: 2.w),
          color: color ?? Colors.white,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
