import 'package:flutter/material.dart';
import '../../../shared/shared_widgets.dart';
import '../../screens.dart';
import '../../../../models/models.dart';

class ShopCategoryPage extends StatelessWidget {
  ShopCategoryPage({this.categoryTitle, this.slug, this.categoryList});

  final String categoryTitle;
  final String slug;
  final List<Category> categoryList;

  final List<Map<String, dynamic>> list = [];
  void currentList() {
    categoryList.forEach((cat) => {
          if (slug == cat.menu)
            {
              list.add({"title": cat.category, "slug": cat.menu})
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    currentList();
    final textTheme = Theme.of(context).textTheme;
    // print(categoryTitle);
    return Scaffold(
      appBar: customAppBar(categoryTitle),
      body: Container(
        child: ListView(
          children: list
              .map(
                (e) => InkWell(
                  splashColor: Color(0xffffb6c1),
                  highlightColor: Colors.grey.shade100,
                  onTap: () {
                    // print(e);
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductsListScreen(product: e['title'],slug: e['slug'],)));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(21.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffffb6c1), width: 1.0),
                        ),
                      ),
                      child: Text(
                        e['title'],
                        style: textTheme.headline6
                            .copyWith(fontWeight: FontWeight.w300),
                      )),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
