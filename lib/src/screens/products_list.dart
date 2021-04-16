import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wigtools/src/screens/product_details.dart';
import 'package:wigtools/src/shared/shared_widgets.dart';
import 'package:wigtools/src/services/services.dart';
import 'package:wigtools/utils/utils.dart';

import '../providers/app_providers.dart';
import '../../models/models.dart';
import './screens.dart';

class ProductsListScreen extends ConsumerWidget {
  static String id = 'productsPg';

  ProductsListScreen({@required this.product, @required this.slug});
  final String product;
  final String slug;

  // final _request = QueryRequest();

  final scaffoldKey = GlobalKey<ScaffoldState>();
//  dummy data
  final productsList = DummyProducts().dummyProducts();
  // use snackNotifier
  final notImplemented = actionFailedNotifier(info: 'Oops! not available...');
  final addToWishlist = actionPassedNotifier(info: 'Item add to wishlist!');
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final productslist = watch(products(product));

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(product),
      body: Container(
        child: Column(
          children: [
            // fillter and sort button
            // Row(
            //   // crossAxisAlignment: CrossAxisAlignment.stretch,
            //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               // width: 1.5,
            //               color: Theme.of(context).accentColor)),
            //       child: MaterialButton(
            //         child: Text('Sort'),
            //         onPressed: () {},
            //       ),
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //               // width: 1.5,
            //               color: Theme.of(context).accentColor)),
            //       child: MaterialButton(
            //         child: Text('Fiter'),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ],
            // ),
            productslist.when(
                data: (data) {
                  if (data.length <= 0) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.store,
                                color: Colors.orange.shade800,
                                size: 48.0,
                              ),
                              Text(
                                'Product Not Found',
                                style: textTheme.headline6.copyWith(
                                  color: Colors.orange.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 28.0, right: 28.0, top: 21.0),
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    ProductDetailsScreen()));
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // ScaffoldMessenger.of(context).showSnackBar(notImplemented);
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "NGN ${e['price']}k\n",
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
                                              // ScaffoldMessenger.of(context).showSnackBar(notImplemented);
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
                  );
                },
                loading: () => Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )),
                error: ((err, stk) => Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(
                          left: 28.0, right: 28.0, top: 21.0),
                      child: Text('Oops! An error occured...'),
                    )))),
          ],
        ),
      ),
    );
  }
}
