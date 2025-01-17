import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerAdaptive {
  final BuildContext context;
  final DateTime? initialDate;

  DatePickerAdaptive(this.context, {this.initialDate});

  Future<DateTime?> show() async {
    if (Platform.isIOS) {
      DateTime? selectedDate = initialDate ?? DateTime.now();
      await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.r,
                  spreadRadius: 2.r,
                )
              ],
            ),
            height: 250.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: CupertinoDatePicker(
                        initialDateTime: selectedDate,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime newDate) {
                          selectedDate = newDate;
                        },
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Colors.grey),
                    Center(
                      child: CupertinoButton(
                        child: const Text(
                          "Done",
                          style: TextStyle(
                            color: CupertinoColors.activeBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(
                            selectedDate,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
    }
    return null;
  }
}
