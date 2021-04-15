import 'package:flutter/material.dart';

class WishlistDismissible extends StatelessWidget {
  const WishlistDismissible(
      {@required this.wishlistProduct, @required this.index});

  final List<String> wishlistProduct;
  final int index;
  // final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Dismissible(
      key: Key(wishlistProduct[index]),
      onDismissed: (direction) {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/make-over-tool.png'),
                  fit: BoxFit.contain,
                ),
              ),
              height: 110,
              width: screen.width * 0.4,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '{brandName}',
                    style: textTheme.headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '{productName}',
                    style: textTheme.bodyText2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '{productPrice}',
                    style: textTheme.bodyText2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  MaterialButton(
                    color: Color(0xff03AC13),
                    elevation: 1.0,
                    onPressed: () {},
                    child: Text(
                      'Add to Cart',
                      style: textTheme.headline6.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: null,
            //   child: Icon(Icons.delete),
            // )
          ],
        ),
      ),
    );
  }
}
