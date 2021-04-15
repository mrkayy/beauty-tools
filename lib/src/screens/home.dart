import 'package:flutter/material.dart';

// pages import
import './page/pages.dart';
import '../shared/shared_widgets.dart';
// import '../../models/models.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';
  // final Profile user;
  // HomeScreen({@required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentItem = 0;
  final tabs = <Widget>[
    HomePage(),
    ShopPage(),
    CartPage(),
    WishlistPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: true,
      // TODO: refactor appbar to common widget
      appBar: customAppBar(
        'Wig Tools',
      ),

      // page body
      body: tabs[currentItem],

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentItem,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_outlined)
              //  ImageIcon(new AssetImage(
              // 'assets/images/setting.png')), //Icon(Icons.dashboard),
              ),
          BottomNavigationBarItem(
              label: 'Shop', icon: Icon(Icons.storefront_rounded)),
          BottomNavigationBarItem(
              label: 'Cart', icon: Icon(Icons.shopping_bag_outlined)),
          BottomNavigationBarItem(
              label: 'WishList', icon: Icon(Icons.favorite_outline)),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
