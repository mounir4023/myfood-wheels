import 'package:flutter/material.dart';
import 'package:foodonwheel/components/custom_header.dart';
import 'package:foodonwheel/constants/image_constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Map<String, String>> foods = [
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
  ];

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  Widget renderAddList() {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, String> food = foods[index];
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'details',
                arguments: {
                  'product': food,
                  'index': index,
                },
              );
            },
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(food['name']!),
                                const Icon(Icons.delete_outline)
                              ],
                            ),
                            Text('\$${food['price']}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const Icon(Icons.remove),
                                Container(
                                  color: primaryColor,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 12.0,
                                  ),
                                  child: const Text(
                                    'Add To 2',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderTracking() {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, String> food = foods[index];
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'details',
                arguments: {
                  'product': food,
                  'index': index,
                },
              );
            },
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(food['name']!),
                                  Text(
                                    'Item-2',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            Text('\$${food['price']}'),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'View Detail',
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderDoneOrder() {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, String> food = foods[index];
        Color primaryColor = Theme.of(context).primaryColor;
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'details',
                arguments: {
                  'product': food,
                  'index': index,
                },
              );
            },
            child: Hero(
              tag: 'detail_food$index',
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(food['image']!),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(food['name']!),
                            ),
                            Text('\$${food['price']}'),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(food['rate']!),
                                    Text(
                                      'Give your review',
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomHeader(
            title: 'Cart Food',
            quantity: foods.length,
            internalScreen: false,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black87,
              tabs: const <Widget>[
                Tab(text: 'Add Food'),
                Tab(text: 'Tracking Order'),
                Tab(text: 'Done Order'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: renderAddList(),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 35.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: theme.primaryColor,
                        ),
                        child: const Text(
                          'CHECKOUT',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.20 * foods.length,
                        width: size.width,
                        child: renderTracking(),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 35.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: theme.primaryColor,
                        ),
                        child: Row(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.location_searching,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'View Tracking Order',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  renderDoneOrder(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
