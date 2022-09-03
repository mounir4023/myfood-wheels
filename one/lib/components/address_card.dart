import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/custom_text_button.dart';
import 'package:foodonwheel/models/address_mock_model.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/add_edit_address.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';

class CustomAddressCard extends StatefulWidget {
  CustomAddressCard({Key? key, required this.listOfAddress}) : super(key: key);
  List<AddressMockModel> listOfAddress = [];

  static Widget create(BuildContext context) {
    List<AddressMockModel> listOfAddress = [];
    for (var value in AddressMockData.addressMockData) {
      listOfAddress.add(AddressMockModel.fromJson(value));
    }
    return CustomAddressCard(listOfAddress: listOfAddress);
  }

  @override
  State<CustomAddressCard> createState() => _CustomAddressCardState();
}

class _CustomAddressCardState extends State<CustomAddressCard> {
  @override
  Widget build(BuildContext context) {
    // print(listOfAddress[0]);
    // print(listOfAddress[0]);
    // print("-------------------");
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, top: 20.h, bottom: 10.h),
                    child: Text(
                      "Saved Address",
                      style: TextStyleUtil.txt24(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              if (widget.listOfAddress.isEmpty) Text("No Address"),
              for (int i = 0; i < widget.listOfAddress.length; i++)
                addressTile(context, widget.listOfAddress[i], i)
            ],
          ),
        ],
      ),
    );
  }

  Widget addressTile(BuildContext context, AddressMockModel addressData, int listIndex) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: const Icon(Icons.home, size: 30),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  addressData.address + ' ' + addressData.city + ' ' + addressData.pincode,
                  style: TextStyleUtil.txt18(),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 42.w),
          child: Row(
            children: [
              customTextButton(
                textButtonClick: () {
                  Get.to(() => AddEditAddress(addressMockModel: addressData));
                },
                textButtonColor: Theme.of(context).primaryColor,
                textButtonTitle: "Edit",
              ),
              customTextButton(
                textButtonClick: () {
                  setState(() {
                    widget.listOfAddress.removeAt(listIndex);
                  });
                  // refresh();
                },
                textButtonColor: Theme.of(context).primaryColor,
                textButtonTitle: "Delete",
              ),
            ],
          ),
        ),
        const Divider(height: 2, indent: 20, endIndent: 20, color: Colors.black26),
        const SizedBox(height: 10),
      ],
    );
  }

  void refresh() {
    print("called");
    setState(() {});
  }
}
