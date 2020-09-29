import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcom/models/cart.dart';
import 'package:mindcom/models/cartmodel.dart';
import 'package:mindcom/models/diagnostic_tests.dart';
import 'package:mindcom/screens/checkOutScreen.dart.dart';
import 'package:mindcom/screens/search_screen.dart';

import 'package:mindcom/widgets/add_new_product.dart';
import 'package:mindcom/widgets/diagonstic_item.dart';
import 'package:mindcom/widgets/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product-screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ValueSetter<CartModel> _valueSetter;
  TextEditingController searchContoller = TextEditingController();
  List<DiagnosticTests> diagnosticTests;
  bool isSearching = false;
  List<CartModel> cartModel = [];
  int qty = 1;

  clearSearch() {
    searchContoller.clear();
  }

  void _addNewProduct(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddNewProduct(),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('Home')
            : TextField(
                controller: searchContoller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Product here",
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (String query) {},
              ),
        actions: [
          IconButton(
              // icon: !isSearching
              //     ? IconButton(
              //         icon: Icon(Icons.search),
              //         onPressed: () {},
              //       )
              //     : IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              }),
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products")
                        .orderBy("createdAt", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Loading(
                          indicator: BallGridPulseIndicator(),
                          size: 100,
                          color: Theme.of(context).primaryColor,
                        );
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text('Loading...');
                        default:
                          return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot products =
                                  snapshot.data.docs[index];

                              Map getDocs = products.data();

                              return Stack(
                                children: [
                                  DiagonsticItem(
                                    DiagnosticTests(
                                      id: products.id,
                                      b2b_rate: getDocs['b2b_rate'],
                                      mrp: getDocs['mrp'],
                                      rep_time: getDocs['rep_time'],
                                      specimen: getDocs['specimen'],
                                      test: getDocs['test'],
                                      test_code: getDocs['test_code'],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (qty > 1) {
                                            setState(() {
                                              qty = --qty;
                                            });
                                          }
                                        },
                                        child:
                                            Icon(Icons.subdirectory_arrow_left),
                                      ),
                                      SizedBox(
                                        width: 25.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            qty = qty++;
                                          });
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                                // title: Text(products.data()[index].test),
                                // trailing: Text(
                                //   "\$" + cartModel[index].mrp.toString(),
                                // ),
                                // onTap: () {
                                //   _valueSetter(cartModel[index]);
                                // },
                              );
                            },
                          );
                      }
                    })),
          ],
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewProduct(context),
        tooltip: 'Add Products',
        child: Icon(Icons.add),
      ),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80.0,
      width: size.width,
      child: FlatButton(
          onPressed: () {},
          child: Text(
            "Add to your cart",
            style: TextStyle(fontSize: 18.0),
          )),
    );
  }
}
