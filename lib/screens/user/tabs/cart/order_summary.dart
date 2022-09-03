import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/buttons.dart';
import 'package:foodonwheel/components/cart_card.dart';
import 'package:foodonwheel/components/custom_appbar.dart';
import 'package:foodonwheel/components/custom_text_button.dart';
import 'package:foodonwheel/components/new_button_address.dart';
import 'package:foodonwheel/constants/app_constants.dart';
import 'package:foodonwheel/controller/address_controller.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/cart/cart.dart';
import 'package:foodonwheel/screens/user/tabs/cart/widgets/row_text.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressData = Get.find<AddressController>().listOfAddress[0];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mediaHeight(context, 1),
        width: mediaWidth(context, 1),
        child: Padding(
          padding: EdgeInsets.all(23.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBar(appBarTextTitle: "Order Summary"),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                height: 80.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                      width: 1,
                      color: ColorsUtils.themeColor,
                    ),
                  ),
                  color: Colors.white,
                  child: Center(
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          addressData.address + ' ' + addressData.city + ' ' + addressData.pincode,
                          style: TextStyleUtil.txt18(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      width: 1,
                      color: ColorsUtils.themeColor,
                    ),
                  ),
                  color: Colors.white,
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.w, top: 10.h),
                      child: Text(
                        "Delivery",
                        style: TextStyleUtil.txt18(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                height: 80.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                      width: 1,
                      color: ColorsUtils.themeColor,
                    ),
                  ),
                  color: Colors.white,
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 8.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              contactInfoTile(
                                  addressData: addressData.firstName, myIcon: Icons.person),
                              SizedBox(width: 50.w),
                              contactInfoTile(
                                  addressData: addressData.phoneno, myIcon: Icons.phone),
                            ],
                          ),
                          Row(
                            children: [
                              contactInfoTile(addressData: addressData.pincode, myIcon: Icons.home),
                            ],
                          ),
                        ], //
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newButtonAddress(
                    context: context,
                    title: "${Get.find<ProductDetailsController>().cardProductModel.length}" +
                        " Items",
                    onClick: () {},
                    buttonContainerColor: ColorsUtils.themeColor,
                    buttonHeight: 30,
                    buttonWidth: 100,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView.builder(
                    itemCount: Get.find<ProductDetailsController>().cardProductModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      ProductModel food =
                          Get.find<ProductDetailsController>().cardProductModel[index];
                      return cartCard(food: food);
                    }),
              ),
              customColumnTemp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactInfoTile({required String addressData, required IconData myIcon}) {
    return Row(
      children: [
        Icon(myIcon, color: ColorsUtils.themeColor, size: 26),
        SizedBox(width: 5.w),
        Text(addressData.capitalizeFirst!, style: TextStyleUtil.txt18()),
        // ListTile(
        //   title: Text(addressData.toString()),
        //   contentPadding: EdgeInsets.all(0),
        //   minLeadingWidth: 0,
        //   horizontalTitleGap: 5,
        // ),
      ],
    );
  }

  Widget customColumnTemp(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Container(child: Text("Address")),
        // Container(child: Text("Order Type")),
        // Container(child: Text("Contact Info")),
        // const Cart(),
        SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
              child: Column(
                children: [
                  Text("Amount Details", style: TextStyleUtil.txt20(color: Colors.black)),
                  const RowText(rowTitle: "Amount", price: "1"),
                  const RowText(rowTitle: "GST", price: "18 %"),
                  const RowText(rowTitle: "Delivery Charges", price: "40"),
                  const RowText(rowTitle: "Total Amount", price: "270")
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        button(context: context, title: "Go to final Payments", onClick: () {}),
      ],
    );
  }
}
