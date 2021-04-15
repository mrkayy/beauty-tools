import 'package:flutter/material.dart';
import 'package:wigtools/src/screens/product_details.dart';
import 'package:wigtools/src/shared/shared_widgets.dart';
import 'package:wigtools/utils/utils.dart';
import 'package:wigtools/src/services/services.dart';

import './screens.dart';

class ProductsListScreen extends StatefulWidget {
  static String id = 'productsPg';

  ProductsListScreen({this.products});
  final String products;

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
//  dummy data
  final productsList = DummyProducts().dummyProducts();
  // use snackNotifier
  final notImplemented = actionFailedNotifier(info: 'Oops! not available...');
  final addToWishlist = actionPassedNotifier(info: 'Item add to wishlist!');
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(widget.products),
      body: Container(
        child: Column(
          children: [
            // fillter and sort button
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: Theme.of(context).accentColor)),
                  child: MaterialButton(
                    child: Text('Sort'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: Theme.of(context).accentColor)),
                  child: MaterialButton(
                    child: Text('Fiter'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 21.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 2 / 4.2,
                  ),
                  children: productsList
                      .map(
                        (e) => Container(
                          // color: Colors.grey.shade300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ProductDetailsScreen()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  height: screen.height * 0.3,
                                  // width: screen.width * 0.23,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/${e["imgArray"]}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      scaffoldKey.currentState
                                          .showSnackBar(notImplemented);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "NGN ${e['price']}k\n",
                                              style: textTheme.bodyText1),
                                          TextSpan(
                                              text: "${e['pName']}",
                                              style: textTheme.bodyText1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        scaffoldKey.currentState
                                            .showSnackBar(addToWishlist);
                                      },
                                      child: Icon(
                                        Icons.favorite_outline,
                                        color: Color(0xffffb6c1),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
