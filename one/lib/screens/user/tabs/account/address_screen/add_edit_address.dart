import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/custom_appbar.dart';
import 'package:foodonwheel/constants/app_constants.dart';
import 'package:foodonwheel/models/address_mock_model.dart';
import 'package:foodonwheel/components/address_card.dart';
import 'package:foodonwheel/components/new_button_address.dart';
import 'package:foodonwheel/components/new_text_form_field.dart';
import 'package:foodonwheel/components/radio_button.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/view_address.dart';
import 'package:get/get.dart';

enum HomeOfficeEnum { Home, Office }

class AddEditAddress extends StatefulWidget {
  const AddEditAddress({Key? key, this.addressMockModel}) : super(key: key);
  final AddressMockModel? addressMockModel;

  @override
  State<AddEditAddress> createState() => _AddEditAddressState();
}

class _AddEditAddressState extends State<AddEditAddress> {
  final _formKey = GlobalKey<FormState>();
  String? _selectHomeOffice = "Home";

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController flatHouseController = TextEditingController();

  TextEditingController towerNumberController = TextEditingController();

  TextEditingController buildingController = TextEditingController();

  TextEditingController landmarkController = TextEditingController();

  TextEditingController pinCodeController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController altPhoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.addressMockModel != null) {
      firstNameController.text = widget.addressMockModel!.firstName;
      lastNameController.text = widget.addressMockModel!.lastName;
      addressController.text = widget.addressMockModel!.address;
      flatHouseController.text = widget.addressMockModel!.flathouseNo;
      towerNumberController.text = widget.addressMockModel!.towerNo;
      buildingController.text = widget.addressMockModel!.buildingApartment;
      landmarkController.text = widget.addressMockModel!.landmark;
      pinCodeController.text = widget.addressMockModel!.pincode;
      cityController.text = widget.addressMockModel!.city;
      stateNameController.text = widget.addressMockModel!.state;
      phoneNumberController.text = widget.addressMockModel!.phoneno;
    }
  }

  addToAddressMockData() {
    AddressMockData.addressMockData.add({
      "address_id": "0",
      "first_name": firstNameController.text ?? '',
      "last_name": lastNameController.text ?? '',
      "address": addressController.text ?? '',
      "flathouse_no": flatHouseController.text ?? '',
      "tower_no": towerNumberController.text ?? '',
      "building_apartment": buildingController.text ?? '',
      "landmark": landmarkController.text ?? '',
      "pincode": pinCodeController.text ?? '',
      "city": cityController.text ?? '',
      "state": stateNameController.text ?? '',
      "phoneno": phoneNumberController.text ?? '',
      "alt_phone_no": phoneNumberController.text ?? '',
    });
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
                appBarTextTitle: "My New Address",
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "First Name",
                              textEditingController: firstNameController,
                              // initialValue: widget.addressMockModel?.firstName.toString() ?? "",
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "Last Name",
                              textEditingController: lastNameController,
                              // initialValue: widget.addressMockModel?.lastName.toString() ?? "",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Address ",
                        textEditingController: addressController,
                        // initialValue: widget.addressMockModel?.address.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Flat/ House No. ",
                        textEditingController: flatHouseController,
                        // initialValue: widget.addressMockModel?.flathouseNo.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Tower No. ",
                        textEditingController: towerNumberController,
                        // initialValue: widget.addressMockModel?.towerNo.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Building/ Apartment ",
                        textEditingController: buildingController,
                        // initialValue: widget.addressMockModel?.buildingApartment.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Landmark ",
                        textEditingController: landmarkController,
                        // initialValue: widget.addressMockModel?.landmark.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Pincode ",
                        textEditingController: pinCodeController,
                        // initialValue: widget.addressMockModel?.pincode.toString() ?? "",
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "City",
                              textEditingController: cityController,
                              // initialValue: widget.addressMockModel?.city.toString() ?? "",
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "State",
                              textEditingController: stateNameController,
                              // initialValue: widget.addressMockModel?.state.toString() ?? "",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "Phone Number",
                              textEditingController: phoneNumberController,
                              // initialValue: widget.addressMockModel?.phoneno.toString() ?? "",
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "Alternate Phone Number",
                              textEditingController: altPhoneNumberController,
                              // initialValue: widget.addressMockModel?.altPhoneNo ?? "",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyRadioOption<String>(
                            value: "Home",
                            text: "Home",
                            groupValue: _selectHomeOffice,
                            onChanged: (value) {
                              setState(() {
                                _selectHomeOffice = value;
                              });
                            },
                          ),
                          MyRadioOption<String>(
                            value: "Office",
                            text: "Office",
                            groupValue: _selectHomeOffice,
                            onChanged: (value) {
                              setState(() {
                                _selectHomeOffice = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: newButtonAddress(
                              context: context,
                              title: "Save",
                              onClick: () async {
                                await addToAddressMockData();
                                Get.to(() => const ViewAddress());
                              },
                              buttonWidth: 50,
                              buttonHeight: 40,
                              buttonContainerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                              child: newButtonAddress(
                            context: context,
                            title: "Cancel",
                            onClick: () {},
                            buttonWidth: 50,
                            buttonHeight: 40,
                            buttonContainerColor: Colors.grey,
                          )),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      // CustomAddressCard.create(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
