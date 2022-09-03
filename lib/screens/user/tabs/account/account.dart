import 'package:flutter/material.dart';
import 'package:foodonwheel/components/food_card.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/view_address.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with TickerProviderStateMixin {
  TabController? _tabController;
  bool switchValue = true;
  List<ProductModel> favoriteProductModel = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    if (Get.find<ProductDetailsController>().listProduct.isNotEmpty) {
      for (var prdouct in Get.find<ProductDetailsController>().listProduct) {
        if (prdouct.isLike.value) {
          favoriteProductModel.add(prdouct);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              bottom: 15.0,
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 35.0,
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Full Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Icon(
                    Icons.location_on,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 25.0,
          //     horizontal: 5.0,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: <Widget>[
          //       Column(
          //         children: <Widget>[
          //           Text(
          //             '250K',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: theme.primaryColor,
          //             ),
          //           ),
          //           Text(
          //             'Follower',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: Colors.grey[500],
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: <Widget>[
          //           Text(
          //             '500',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: theme.primaryColor,
          //             ),
          //           ),
          //           Text(
          //             'Following',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: Colors.grey[500],
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: <Widget>[
          //           Text(
          //             '540',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: theme.primaryColor,
          //             ),
          //           ),
          //           Text(
          //             'Taste Master',
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               color: Colors.grey[500],
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: theme.primaryColor,
              labelStyle: const TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.black,
              tabs: const <Widget>[
                Tab(text: 'Your Favorite'),
                Tab(text: 'Account Setting'),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Get.find<ProductDetailsController>().listProduct.isEmpty
                  ? Container()
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: favoriteProductModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FoodCard(
                            width: size.width,
                            primaryColor: theme.primaryColor,
                            productModel: favoriteProductModel[index]);
                      }),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ))),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const ViewAddress());
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 25.0,
                              color: theme.primaryColor,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Text(
                                'Address',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Location',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.local_shipping,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Shipping',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Payment',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
