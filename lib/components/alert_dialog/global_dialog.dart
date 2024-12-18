// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalDialog {
  final BuildContext context;
  final Widget? header;
  final String title;
  final String? description;
  final Widget? mainButton;

  final Widget? secondaryButton;

  GlobalDialog(
    this.context, {
    this.secondaryButton,
    this.mainButton,
    required this.title,
    this.description,
    required this.header,
  });
  Future<dynamic> show() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          clipBehavior: Clip.antiAlias,
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: header,
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (description != null)
                  SizedBox(
                    height: 14.h,
                  ),
                if (description != null)
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      description!,
                      style: TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (mainButton != null)
                  SizedBox(
                    height: 20.h,
                  ),
                if (mainButton != null) mainButton!,
                if (secondaryButton != null) ...[
                  const Divider(),
                  secondaryButton!
                ],
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
