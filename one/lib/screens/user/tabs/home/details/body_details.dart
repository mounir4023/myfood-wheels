import 'package:flutter/material.dart';
import 'package:foodonwheel/components/custom_header.dart';
import 'package:foodonwheel/models/product_model.dart';

Widget iconBadge({@required IconData? icon, @required Color? iconColor}) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4.0,
          offset: Offset(3.0, 3.0),
        )
      ],
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Icon(
      icon,
      size: 20.0,
      color: iconColor,
    ),
  );
}

Widget detailsTab() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ut enim leo. In sagittis velit nibh. Morbi sollicitudin lorem vitae nisi iaculis,sit amet suscipit orci mollis. Ut dictum lectus eget diam vestibulum, at eleifend felis mattis. Sed molestie congue magna at venenatis. In mollis felis ut consectetur consequat.',
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 20.0),
        color: const Color.fromRGBO(250, 250, 250, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.history,
                  color: Colors.blue[900],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('12am - 3pm'),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.gps_fixed,
                  color: Colors.green[300],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('3.54 km'),
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.map,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Map view'),
                )
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.directions_walk,
                  color: Colors.deepOrange,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Delivery'),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget renderCardReview() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Person',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'December 14, 2019',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50.0,
            top: 2.0,
          ),
          child: const Text(
            'Cras ac nunc pretium, lacinia lorem ut, congue metus. Aenean vitae lectus at mauris eleifend placerat. Proin a nisl ut risus euismod ultrices et sed dui.',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        )
      ],
    ),
  );
}

Widget reviewTab() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        renderCardReview(),
        renderCardReview(),
        renderCardReview(),
        renderCardReview(),
      ],
    ),
  );
}

class BodyDetails extends StatefulWidget {
  ProductModel? screenArguments;
  BodyDetails({Key? key, this.screenArguments}) : super(key: key);

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails>
    with TickerProviderStateMixin {
  int quantity = 0;
  int screenTab = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomHeader(
            title: '',
            quantity: quantity,
            internalScreen: true,
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.55,
              left: 50.0,
              right: 50.0,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 65.0, bottom: 10.0),
            child: iconBadge(
              icon: Icons.favorite,
              iconColor: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              width: size.width - 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        iconBadge(
                          icon: Icons.near_me,
                          iconColor: theme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.screenArguments!.name.toString(),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '\$ ${widget.screenArguments!.price}',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'by',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        const Text(' Restaurant'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            size: 30.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text(
                            'Add To Bad',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30.0,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: theme.primaryColor,
                      labelPadding: const EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      labelStyle: const TextStyle(
                        fontSize: 18.0,
                      ),
                      tabs: [
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'DETAILES',
                          ),
                        ),
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Review',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        detailsTab(),
                        reviewTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
