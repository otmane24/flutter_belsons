import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutoCompleteTextFormField<T> extends StatefulWidget {
  final Function(String?) onSelected;
  final Function() onTap;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final List<String> items;
  final List<String>? selectedItems;
  final FocusNode focusNode;
  final Color searchBackgroundColor;
  final Color suffixIconColor;

  const AutoCompleteTextFormField(
      {super.key,
      required this.items,
      this.selectedItems,
      required this.onTap,
      required this.onSelected,
      required this.controller,
      this.hintText,
      this.labelText,
      this.searchBackgroundColor = Colors.white,
      this.suffixIconColor = Colors.brown,
      required this.focusNode});

  @override
  State<AutoCompleteTextFormField> createState() =>
      _AutoCompleteTextFormFieldState();
}

class _AutoCompleteTextFormFieldState<T>
    extends State<AutoCompleteTextFormField> {
  late List<String> searchItems;

  @override
  void initState() {
    super.initState();
    searchItems = widget.items;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onTap: widget.onTap,
            onChanged: (value) {
              searchItems = widget.items;

              if (value != '') {
                searchItems = searchItems
                    .where((item) =>
                        item.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              }
              setState(() {});
            },
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: Icon(
                Icons.search,
                color: widget.suffixIconColor,
                size: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          if (widget.focusNode.hasFocus)
            Container(
              constraints: BoxConstraints(maxHeight: 120.h),
              decoration: BoxDecoration(
                color: widget.searchBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 4.r,
                  )
                ],
              ),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return searchItems.isNotEmpty
                      ? GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              widget.focusNode.unfocus();
                              widget.onSelected(searchItems[index]);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            alignment: Alignment.centerLeft,
                            height: 28.h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    searchItems[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                if (widget.selectedItems != null &&
                                    widget.selectedItems!
                                        .contains(searchItems[index]))
                                  SvgPicture.asset(
                                    'assets/images/svgs/check.svg',
                                    width: 16.w,
                                  )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.centerLeft,
                          height: 28.h,
                          child: Text(
                            'No Item Found',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                },
                itemCount: searchItems.isNotEmpty ? searchItems.length : 1,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Divider(
                    color: Color(int.parse("FFC4C4C4", radix: 16)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
