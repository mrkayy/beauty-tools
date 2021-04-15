import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/shop_category_card.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, String>> shopCategory = <Map<String, String>>[
    {'title': 'Hair Care', 'imgName': 'pick-care.jpg'},
    {'title': 'Hair Color', 'imgName': 'pick-color.jpg'},
    {'title': 'Hair Styling Tools', 'imgName': 'pick-tools.jpg'},
    {'title': 'Tools and Accessories', 'imgName': 'pick-tools-accessories.jpg'},
    {'title': 'Makeup Nails & Tools', 'imgName': 'pick-nails.jpg'},
    {'title': 'Extension Wigs & Accessories', 'imgName': 'pick-wigs.jpg'},
    {'title': 'Gift Items', 'imgName': 'pick-gift.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
// user flutter hookController
    // final searchTextController = useTextEditingController();
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
            left: 28.0, right: 28.0, top: 21.0, bottom: 18.0),
        child: Column(
          children: [
            // search button
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
              // padding: const EdgeInsets.all(18.0),
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 2.0,
                child: TextField(
                  onChanged: (e) {},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                  ),
                ),
              ),
            ),
            // order category
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Color(0xffffb6c1),
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Shop Everything Hair And Beauty With Wigtools',
                      textAlign: TextAlign.center,
                      style: textTheme.headline5
                          .copyWith(color: Colors.white, height: 1.25)),
                  Text(
                    'Beauty Supply Store',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText1.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            // shop discount and offers
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Shop at best prices with up to 50% off',
                style: textTheme.bodyText2.copyWith(color: Color(0xffffb6c1)),
              ),
            ),
            // TODO:change image banners
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // height: ,
                  // width:
                  child: Image.asset(
                    'assets/images/make-over.png',
                    // height: screen.height * 0.376,
                    width: screen.width * 0.382,
                  ),
                ),
                Container(
                  // height: screen.height * 0.254,
                  // width: screen.width * 0.4,
                  child: Image.asset(
                    'assets/images/make-over1.png',
                    // height: screen.height * 0.376,
                    width: screen.width * 0.382,
                  ),
                ),
              ],
            ),
            // Shop by Category
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Shop By Category',
                style: textTheme.headline6.copyWith(),
              ),
            ),
            Container(
              height: screen.height * 0.4,
              // color: Theme.of(context).accentColor,
              child: GridView(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 2.95,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  children: shopCategory
                      .map(
                        (e) => ShopCategoryWidget(
                            title: e['title'], imgName: e['imgName']),
                      )
                      .toList()),
            ),
            SizedBox(height: screen.height * 0.03),
            // Container(
            //   margin: const EdgeInsets.only(top: 12.0),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Image.asset(
            //         'assets/images/wig-kids.png',
            //         width: screen.width * 0.37,
            //       ),
            //       Container(
            //         margin: const EdgeInsets.only(left: 10.0),
            //         width: screen.width * 0.35,
            //         alignment: Alignment.centerRight,
            //         child: Text(
            //           'The kids are not left out, shop various hair care products that can serve the tender nature of your children’s hair.',
            //           style: textTheme.bodyText1.copyWith(
            //             height: 1.2,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
