import 'package:flutter/material.dart';

class ShopCategoryWidget extends StatelessWidget {
  const ShopCategoryWidget({
    @required this.title,
    @required this.imgName,
  });

  final String title;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/${imgName}',
          width: screen.width * 0.32,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.bodyText2
              .copyWith(fontWeight: FontWeight.bold, height: 1.2),
        ),
      ],
    );
  }
}
