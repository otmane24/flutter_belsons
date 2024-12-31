// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalDialog {
  final BuildContext context;
  final Widget? header;
  final String title;
  final String? descriptionTitle;
  final EdgeInsets? contentPadding;
  final Widget? description;
  final Widget? mainButton;

  final Widget? secondaryButton;

  GlobalDialog(
    this.context, {
    this.secondaryButton,
    this.mainButton,
    required this.title,
    this.descriptionTitle,
    this.contentPadding,
    this.description,
    required this.header,
  }) : assert(!(description != null && descriptionTitle != null),
            'Declaring both descriptionTitle and description is not supported.');
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
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Center(
                    child: header,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
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
                ),
                if (descriptionTitle != null || description != null)
                  SizedBox(
                    height: 14.h,
                  ),
                if (description != null)
                  Padding(
                    padding: contentPadding ??
                        EdgeInsets.symmetric(horizontal: 24.w),
                    child: description!,
                  ),
                if (descriptionTitle != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        descriptionTitle!,
                        style: TextStyle(fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (mainButton != null)
                  SizedBox(
                    height: 20.h,
                  ),
                if (mainButton != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: mainButton!,
                  ),
                if (secondaryButton != null) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Divider(
                      height: 16.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: secondaryButton!,
                  )
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
