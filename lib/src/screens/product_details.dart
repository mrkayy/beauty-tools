import 'package:flutter/material.dart';
import './screens.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String id = "productsDetails";
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: screen.height * 0.575,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/full-image.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: screen.height * 0.0985,
            // right: 0,
            // left: 0,
            child: Material(
              elevation: 3.0,
              shadowColor: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0)),
                width: screen.width * 0.83,
                height: screen.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '{Product Name}\n',
                                  style: theme.headline6,
                                ),
                                TextSpan(
                                  text: '{Gold}',
                                  style: theme.headline6,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/kids-kit.png',
                            height: 50.0,
                          )
                        ]),
                    Container(
                      width: screen.width * 0.55,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id nunc sodales amet, lacus non venenatis.',
                        softWrap: true,
                        style: TextStyle(height: 1.3),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        elevation: 0.70,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        textColor: Colors.white,
                        color: Color(0xffffb6c1),
                        minWidth: screen.width * 0.32,
                        height: 40.0,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProductFullDetailsScreen()));
                        },
                        child: Text('Details'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Cart icon/badge
          Positioned(
              top: 58.0,
              right: 0.0,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(PaymentMethod.id);
                },
                child: Material(
                  elevation: 4.0,
                  shadowColor: Color(0xffffb6c1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0)),
                  child: Container(
                    width: 65,
                    height: screen.height * 0.06,
                    // padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.3, color: Color(0xffffb6c1)),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0))),
                    alignment: Alignment.center,
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Positioned(
                          right: -20.0,
                          top: -5.0,
                          child: Container(
                            // padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            width: screen.width * 0.08,
                            height: screen.height * 0.03,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffffb6c1),
                            ),
                            child: Text('2'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
