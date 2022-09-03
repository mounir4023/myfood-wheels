import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextFormField newTextFormField({
  required String hintText,
  required TextEditingController textEditingController,
  // String initialValue='',
}) {
  return TextFormField(
    // initialValue: initialValue,
    controller: textEditingController,
    textAlign: TextAlign.start,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 15.h, left: 15.w),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade400, width: 1)),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 18.sp, height: 1),
    ),
  );
}
