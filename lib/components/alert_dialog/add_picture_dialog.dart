// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_belsons/components/buttons/secondary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_belsons/components/buttons/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddPictureDialog {
  final BuildContext context;

  final String? title;
  final String? mainButtonTitle;
  final String? secondaryButtonTitle;
  final Widget? header;
  final Function(List<File>)? onSelectedMultiImages;
  final Function(File)? onSelectedImage;
  final bool multiImages;
  final Color color;
  final Color borderColor;

  AddPictureDialog(
    this.context, {
    this.title,
    this.header,
    this.mainButtonTitle,
    this.secondaryButtonTitle,
    this.multiImages = false,
    this.onSelectedMultiImages,
    this.onSelectedImage,
    this.color = Colors.white,
    this.borderColor = Colors.red,
  }) : assert(
          multiImages ? onSelectedMultiImages != null : onSelectedImage != null,
          'You must provide the correct callback based on multiImages value',
        );
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
                  child: header ??
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Image.asset(
                          'assets/images/pngs/add_picture.png',
                          width: 80.w,
                        ),
                      ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title ?? "Choose Image Options",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryButton(
                  title: mainButtonTitle ?? "Gallery",
                  color: color,
                  backgroundColor: borderColor,
                  onTap: () async {
                    Navigator.of(context).pop();
                    final picker = ImagePicker();
                    final selectedImages = <File>[];
                    if (multiImages) {
                      final pickedFiles = await picker.pickMultiImage();
                      if (pickedFiles.isNotEmpty) {
                        for (var pickedFile in pickedFiles) {
                          selectedImages.add(File(pickedFile.path));
                        }
                        onSelectedMultiImages!(selectedImages);
                      }
                    } else {
                      final pickedFiles =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFiles != null) {
                        onSelectedImage!(File(pickedFiles.path));
                      }
                    }
                  },
                ),
                const Divider(),
                SecondaryButton(
                  borderColor: borderColor,
                  color: color,
                  onTap: () async {
                    Navigator.of(context).pop();
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      multiImages
                          ? onSelectedMultiImages!([File(pickedFile.path)])
                          : onSelectedImage!(File(pickedFile.path));
                    }
                  },
                  title: secondaryButtonTitle ?? "Photo",
                ),
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
