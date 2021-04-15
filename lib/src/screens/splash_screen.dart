import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

// screen import
import './screens.dart';

class SplashScreen extends StatefulWidget {
  static String id = "initScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<bool> _lastuser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool hasUser;
  //   hasUser ??= prefs.get("hasUser");
  //   print(hasUser);
  //   return hasUser;
  // }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () async {
      // checking user device for user login token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool hasUser;
      hasUser = prefs.get("hasUser") == null || false ? false : true;
      print(hasUser);
      // TODO: add slide transition into the login & signup screens
      if (hasUser) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.id);
      } else {
        Navigator.of(context).pushReplacementNamed(SigninScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints.tightFor(height: screen.height, width: screen.width),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black,
                Color(0xffFFB6C1).withOpacity(0.6),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.tightFor(
                    height: screen.height, width: screen.width),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  alignment: Alignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Wig ',
                            style: textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFFB6C1),
                                fontSize: 36.0),
                          ),
                          TextSpan(
                            text: 'Tools',
                            style: textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                                fontSize: 36.0),
                          ),
                          TextSpan(
                              text: '\nWhere Beauty Begins',
                              style: textTheme.bodyText1.copyWith(
                                  height: 0.3,
                                  color: Color(0xffffffff),
                                  fontSize: 12.0))
                        ],
                      ),
                    ),
                    // TODO: add pulse animation to the heart icon.
                    Positioned(
                        right: -24.0,
                        bottom: 10.0,
                        child: Icon(Icons.favorite, color: Color(0xffffb6c1)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
