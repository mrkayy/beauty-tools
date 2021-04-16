import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wigtools/src/screens/splash_screen.dart';

import '../widgets/widgets.dart';
import '../../../models/models.dart';
import '../../screens/screens.dart';
import '../../providers/app_providers.dart';

class ProfilePage extends ConsumerWidget {
  final List<Widget> _profileScreen = <Widget>[];

  final List<UserProfileOptions> _option = <UserProfileOptions>[
    UserProfileOptions(
      index: 1,
      icon: Icons.person,
      title: 'My Info',
      desc: 'Edit your information, login details and prefernces',
    ),
    UserProfileOptions(
        index: 2,
        icon: Icons.home,
        title: 'Address Book',
        desc: 'Edit or add delivery and biling addresses'),
    UserProfileOptions(
        index: 3,
        icon: Icons.favorite,
        title: 'My Wishlist',
        desc: 'List of all the products you have saved!'),
    UserProfileOptions(
        index: 4,
        icon: Icons.calendar_today,
        title: 'Order Tracking',
        desc: 'View and track your order'),
    UserProfileOptions(
        index: 5, icon: Icons.help, title: 'Need Help', desc: 'click here'),
    UserProfileOptions(
        icon: Icons.settings, title: 'Settings', desc: 'click here'),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authServices = context.read(authsProvider);
    // final profile = context.read(authsProvider);
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    // final profile = context.read(userprofileProvider);
    return Container(
      constraints:
          BoxConstraints.tightFor(height: screen.height, width: screen.width),
      // color: Theme.of(context).accentColor,
      child: Column(
        children: [
          // user title
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 15.0, bottom: 12.0),
            child: Column(
              children: [
                Text('Hello {profile.state.firstName}',
                    style: textTheme.headline5.copyWith()),
                Text(
                  'Welcome to your space at Wig Tools! you can build your wishlist, manage your account and be up to date with our latest products.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          // profile options
          Expanded(
            child: ListView(
              children: _option.map((e) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0),
                    ),
                  ),
                  child: ExpansionTile(
                    // tilePadding: const EdgeInsets.only(top:10),
                    leading: Icon(
                      e.icon,
                      size: 36.0,
                    ),
                    title: Text(
                      e.title,
                      style: textTheme.headline6.copyWith(
                          fontWeight: FontWeight.w300, fontSize: 24.0),
                    ),
                    subtitle: Text(e.desc),
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextButton(
                          child: Text(
                            'logout',
                            style:
                                textTheme.headline6.copyWith(color: Colors.red),
                          ),
                          onPressed: () {
                            authServices.logout().then((value) {
                              if (value) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    SplashScreen.id, (route) => false);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          // ExpansionPanelList(
          //   expansionCallback: (int index, bool isExpanded) {
          //     setState(() {
          //       _option[index].isExpanded = !_option[index].isExpanded;
          //     });
          //   },
          //   children: _option.map((UserProfileOptions options) {
          //     return ExpansionPanel(
          //         headerBuilder: (BuildContext context, bool isExpanded) {
          //           return Text(options.title);
          //         },
          //         body: Container(
          //           child: Text(options.desc),
          //         ));
          //   }).toList(),
          // )
        ],
      ),
    );
  }
}
