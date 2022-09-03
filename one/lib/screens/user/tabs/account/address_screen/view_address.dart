import 'package:flutter/material.dart';
import 'package:foodonwheel/components/custom_appbar.dart';
import 'package:foodonwheel/constants/app_constants.dart';
import 'package:foodonwheel/components/address_card.dart';
import 'package:foodonwheel/components/new_button_address.dart';
import 'package:foodonwheel/models/address_mock_model.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/add_edit_address.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAddress extends StatefulWidget {
  const ViewAddress({Key? key}) : super(key: key);

  @override
  State<ViewAddress> createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
  List<AddressMockModel> listOfAddress = [];
  void addListFunc() {
    for (var value in AddressMockData.addressMockData) {
      listOfAddress.add(AddressMockModel.fromJson(value));
    }
    // return listOfAddress;
  }
  @override
  void initState() {
    super.initState();
    addListFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: mediaHeight(context, 1),
          width: mediaWidth(context, 1),
          child: Column(
            children: [
              customAppBar(
                appBarTextTitle: "My Address",
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h, bottom: 10.h),
                child: newButtonAddress(
                  context: context,
                  title: "Add New Address",
                  onClick: () {
                    Get.to(() => const AddEditAddress());
                  },
                  buttonHeight: 50,
                  buttonWidth: double.infinity,
                  buttonContainerColor: ColorsUtils.themeColor,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
                  children: [
                    Divider(thickness: 1.5.h, color: ColorsUtils.themeColor),
                    SizedBox(height: 10.h),
                    CustomAddressCard.create(context),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
