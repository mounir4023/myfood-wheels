import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';

Widget customAppBar({
  required String appBarTextTitle,
  FontWeight appBarFontTextWeight = FontWeight.normal,
  Color appBarFontColor = Colors.black,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 25.w, bottom: 5.h, top: 25.w, right: 25.w),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Icon(Icons.arrow_back_ios, size: 30.sp, color: Colors.black),
          ),
        ),
        // customTextStyle(
        //     textTitle: appBarTextTitle,
        //     fontTextSize: appBarTitleSize,
        //     fontTextWeight: appBarFontTextWeight,),
        Text(
          appBarTextTitle,
          style: TextStyleUtil.txt24(fontWeight: appBarFontTextWeight, color: appBarFontColor),
        ),
        const SizedBox(),
      ],
    ),
  );
}
