import 'package:flutter/material.dart';
import 'package:foodonwheel/components/food_card.dart';
import 'package:foodonwheel/constants/image_constants.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/home/details/details.dart';
import 'package:foodonwheel/screens/user/tabs/home/details/food_list.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  static final List<Map<String, String>> foodOptions = [
    {
      'name': 'Proteins',
      'image': ImageConstants.PROTEINS_IMAGE,
    },
    {
      'name': 'Burger',
      'image': ImageConstants.BURGER_IMAGE,
    },
    {
      'name': 'Fastfood',
      'image': ImageConstants.FAST_FOOD_IMAGE,
    },
    {
      'name': 'Salads',
      'image': ImageConstants.SALADS_IMAGE,
    }
  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
          child: Obx(
        () => (Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'What would you like to eat?',
                    style: TextStyle(fontSize: 21.0),
                  ),
                  Icon(Icons.notifications_none, size: 28.0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                autocorrect: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  hintText: 'Find a food or Restaurant',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 105,
              margin: const EdgeInsets.only(
                top: 20.0,
                bottom: 25.0,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  itemCount: foodOptions.length,
                  itemBuilder: (context, index) {
                    Map<String, String> option = foodOptions[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => FoodList.create(context, foodOptions[index]));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 35.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    option['image']!,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color: Colors.grey.shade300,
                                    offset: const Offset(6.0, 6.0),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              option['name']!,
                              style: const TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                'Popular Food',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            SizedBox(
              height: 220.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: Get.find<ProductDetailsController>().listProduct.length,
                itemBuilder: (context, index) {
                  ProductModel product = Get.find<ProductDetailsController>().listProduct[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              index: index,
                              product: product,
                            ),
                          ));
                    },
                    child: Hero(
                      tag: 'detail_food$index',
                      child: FoodCard(
                        width: size.width / 2 - 30.0,
                        primaryColor: theme.primaryColor,
                        productName: product.name!,
                        productPrice: product.price!,
                        productUrl: product.image!,
                        productClients: product.clients!,
                        productRate: product.rate!,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
                top: 35.0,
              ),
              child: Text(
                'Best Food',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Map<String, String> localProduct = {
            //       'name': 'The number one!',
            //       'price': '26.00',
            //       'rate': '5.0',
            //       'clients': '150',
            //       'image': ImageConstants.BEST_DISH_IMAGE
            //     };
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Details(
            //             index: popularFood.length,
            //             product: localProduct,
            //           ),
            //         ));
            //   },
            //   child: Hero(
            //     tag: 'detail_food${popularFood.length}',
            //     child: Container(
            //       width: size.width - 40,
            //       color: Colors.white,
            //       padding: const EdgeInsets.only(bottom: 10.0),
            //       margin: const EdgeInsets.only(
            //         left: 20.0,
            //         right: 20.0,
            //         bottom: 15.0,
            //       ),
            //       child: Column(
            //         children: <Widget>[
            //           Stack(
            //             children: <Widget>[
            //               Container(
            //                 height: size.width - 40,
            //                 width: size.width - 40,
            //                 decoration: const BoxDecoration(
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(5.0),
            //                   ),
            //                   image: DecorationImage(
            //                     image:
            //                         AssetImage(ImageConstants.BEST_DISH_IMAGE),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                 alignment: Alignment.topRight,
            //                 margin: const EdgeInsets.all(10.0),
            //                 child: Container(
            //                   padding: const EdgeInsets.all(8.0),
            //                   decoration: const BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color: Colors.white,
            //                   ),
            //                   child: Icon(
            //                     Icons.favorite,
            //                     size: 25.0,
            //                     color: theme.primaryColor,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //               top: 10.0,
            //               bottom: 4.0,
            //               left: 10.0,
            //               right: 10.0,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: <Widget>[
            //                 const Text(
            //                   'The number one!',
            //                   style: TextStyle(
            //                     fontSize: 18.0,
            //                   ),
            //                 ),
            //                 Container(
            //                   padding: const EdgeInsets.all(4.0),
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       shape: BoxShape.circle,
            //                       boxShadow: [
            //                         BoxShadow(
            //                           color: Colors.grey.shade300,
            //                           blurRadius: 4.0,
            //                           offset: const Offset(3.0, 3.0),
            //                         )
            //                       ]),
            //                   child: Icon(
            //                     Icons.near_me,
            //                     size: 22.0,
            //                     color: theme.primaryColor,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //               top: 5.0,
            //               left: 10.0,
            //               right: 10.0,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: <Widget>[
            //                 Text(
            //                   '5.0 (150)',
            //                   style: TextStyle(
            //                     fontSize: 16.0,
            //                     color: Colors.grey[400],
            //                   ),
            //                 ),
            //                 const Text(
            //                   '\$ 26.00',
            //                   style: TextStyle(
            //                     fontSize: 16.0,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        )),
      )),
    );
  }
}
