import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class WishlistPage extends StatefulWidget {
  @override
  WishlistPageState createState() => WishlistPageState();
}

class WishlistPageState extends State<WishlistPage> {
  // final List<Map<String, dynamic>> wishlistProduct = [{}, {}, {}];
  final List<String> wishlistProduct = ["", "", ""];

  @override
  Widget build(BuildContext context) {
// user flutter hookController
    // final searchTextController = useTextEditingController();
    // final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    // final accentColor = Theme.of(context).accentColor;
    return
        // SingleChildScrollView(
        //     child:
        Container(
      margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 21.0),
      // constraints:
      //     BoxConstraints.tightFor(height: screen.height, width: screen.width),
      // color: Theme.of(context).accentColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.center,
            child: Text(
              'Swipe Product(s) to delete',
              // textAlign: TextAlign.center,
              style: textTheme.headline6,
            ),
          ),
          Expanded(
            child: Container(
                child: ListView.builder(
              itemCount: wishlistProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return WishlistDismissible(
                    wishlistProduct: wishlistProduct, index: index);
              },
            )),
          ),
        ],
      ),
      // )
    );
  }
}
