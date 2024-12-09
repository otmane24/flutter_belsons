import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;

  final Widget child;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
  });

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
          border: Border.all(color: backgroundColor ?? Colors.red, width: 2.w),
          color: backgroundColor ?? Colors.red,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
