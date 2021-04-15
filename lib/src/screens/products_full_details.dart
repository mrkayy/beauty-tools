import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class ProductFullDetailsScreen extends StatefulWidget {
  static String id = 'productsPgDetails';
  @override
  _ProductFullDetailsScreenState createState() =>
      _ProductFullDetailsScreenState();
}

class _ProductFullDetailsScreenState extends State<ProductFullDetailsScreen> {
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
      body: Column(
        // alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   child:
          // ),
          ClipPath(
            clipper: ImageCliper(),
            child: Container(
              height: screen.height * 0.475,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/full-image.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: theme.bodyText2,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '{Product Name}\n',
                            style: theme.bodyText2,
                          ),
                          TextSpan(
                            text: '{Gold}\n',
                            style: theme.bodyText2,
                          ),
                          TextSpan(
                            text: '{Gold}\n',
                            style: theme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    // price and qty section
                    Column(
                      children: [],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text('''
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Imperdiet non lacus dui, quis nullam leo nisi, elit. Et dignissim hendrerit posuere augue viverra odio vel maecenas. Pulvinar felis, lectus consequat condimentum. Ipsum volutpat vel blandit egestas gravida adipiscing diam at metus. Mattis non pretium porta non facilisis eget consequat sed. Dictum habitasse vitae vel vitae posuere integer aenean orci sem. Amet at id a, dictumst ut nisi, sit suspendisse. In mattis vitae viverra risus aliquam in risus gravida. Pretium purus facilisi mattis diam interdum molestie gravida.'''),
                ),
                MaterialButton(
                  minWidth: screen.width * 0.6,
                  height: 46.0,
                  color: Color(0xffffb6c1),
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('Add to cart'),
                )
              ],
            ),
          ),

          // Positioned(
          //   bottom: screen.height * 0.3,
          //   child: ),
        ],
      ),
    );
  }
}
