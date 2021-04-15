import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './src/screens/screens.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wig Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffE17F93),
        accentColor: Color(0xffc4c4c4).withOpacity(0.25),
        backgroundColor: Color(0xffffffff),
        fontFamily: "Mukta",
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       bodyText1: TextStyle(fontFamily: "Notosan", fontSize: 14.0),
        //     ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: "Notosan",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff273444),
                    fontSize: 21.0))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        SigninScreen.id: (BuildContext context) => SigninScreen(),
        SignupScreen.id: (BuildContext context) => SignupScreen(),
        HomeScreen.id: (BuildContext context) => HomeScreen(),
        ProductsListScreen.id: (BuildContext context) => ProductsListScreen(),
        PaymentMethod.id: (BuildContext context) => PaymentMethod(),
        ProductDetailsScreen.id: (BuildContext context) =>
            ProductDetailsScreen(),
        ProductFullDetailsScreen.id: (BuildContext context) =>
            ProductFullDetailsScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title',
        ),
      ),
    );
  }
}
