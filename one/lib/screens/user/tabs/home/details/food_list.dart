import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/constants/api_path_constant.dart';
import 'package:foodonwheel/constants/image_constants.dart';
import 'package:foodonwheel/controller/cart_controller.dart';
import 'package:foodonwheel/controller/protein_controller.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/home/home.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  final List<Map<String, String>> foodList = [
    {
      'name': 'Tandoori Chicken',
      'price': '96.00',
      'rate': '4.9',
      'clients': '200',
      'image': ImageConstants.TANDOORI_CHICKEN_IMAGE
    },
    {
      'name': 'Salmon',
      'price': '40.50',
      'rate': '4.5',
      'clients': '168',
      'image': ImageConstants.SALMON_IMAGE
    },
    {
      'name': 'Rice and meat',
      'price': '130.00',
      'rate': '4.8',
      'clients': '150',
      'image': ImageConstants.RICE_MEAT_IMAGE
    },
    {
      'name': 'Vegan food',
      'price': '400.00',
      'rate': '4.2',
      'clients': '150',
      'image': ImageConstants.VEGAN_IMAGE
    },
    {
      'name': 'Rich food',
      'price': '1000.00',
      'rate': '4.6',
      'clients': '10',
      'image': ImageConstants.RICE_MEAT_IMAGE
    }
  ];

  FoodList({Key? key, required this.foodMapDb, required this.proteinListingController})
      : super(key: key);
  final Map<String, String> foodMapDb;
  List<ProductModel> proteinListingController;
  ScrollController scrollController = ScrollController();

  static Widget create(BuildContext context, Map<String, String> foodMapDb) {
    final listController = Get.find<ProteinListingController>();
    listController.fetchProductDetails(APIPath.DISH + '-' + foodMapDb['name']!);
    final listOfFoods = listController.getProteinListings;
    return FoodList(foodMapDb: foodMapDb, proteinListingController: listOfFoods);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(foodMapDb['name']!),
              background: Image.asset(
                foodMapDb['image']!,
                fit: BoxFit.fill,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.hardLight,
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(5.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey.shade300),
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Image.network(
                              proteinListingController[index].image!,
                              width: 126.w,
                              height: 131.h,
                            ),
                            SizedBox(width: 10.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(proteinListingController[index].name.toString(),
                                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400)),
                              SizedBox(height: 12.h),
                              Text(
                                "₹ " + proteinListingController[index].price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(
                                padding: EdgeInsets.all(6.3.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Theme.of(context).primaryColor),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.lazyPut(() => CartController().isCartValue(true));
                                  },
                                  child: Row(children: [
                                    const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                                    Text("Add To cart",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            letterSpacing: 0.5,
                                            color: Colors.white))
                                  ]),
                                ),
                              )
                            ]),
                          ]),
                          Image(
                              height: 25.h,
                              width: 25.w,
                              image: const AssetImage(ImageConstants.VEG_ICON)),
                        ]),
                  );
                },
                childCount:proteinListingController.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
