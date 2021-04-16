import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/app_providers.dart';
import '../widgets/shop_category_card.dart';
import '../../../utils/category_consts.dart';
import '../../../models/models.dart';
import './pages.dart';

class ShopPage extends ConsumerWidget {
  final listOption = ShopCategoryList();

  final List<Map<String, String>> shopCategory = <Map<String, String>>[
    {'slug': 'new-products', 'title': 'New Product', 'imgName': 'cream.png'},
    {'slug': 'hair-care', 'title': 'Hair Care', 'imgName': 'pick-care.jpg'},
    {'slug': 'hair-color', 'title': 'Hair Color', 'imgName': 'pick-color.jpg'},
    {
      'slug': 'hair-styling-tools',
      'title': 'Hair Styling Tools',
      'imgName': 'pick-tools.jpg'
    },
    {
      'slug': 'tools-and-accessories',
      'title': 'Tools & Accessories',
      'imgName': 'pick-tools-accessories.jpg'
    },
    {
      'slug': 'makup-nails-tools',
      'title': 'Makeup Nails & tools',
      'imgName': 'pick-nails.jpg'
    },
    {
      'slug': 'extension-wigs-accessories',
      'title': 'Extension Wigs & Accessories',
      'imgName': 'pick-wigs.jpg'
    },
    {'slug': 'gift-items', 'title': 'Gift Items', 'imgName': 'pick-gift.jpg'},
    {'slug': 'brands', 'title': 'Brands', 'imgName': 'cream.png'},
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final accentColor = Theme.of(context).accentColor;

    final list = watch(category);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 21.0),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 31.0, vertical: 8.0),
              // padding: const EdgeInsets.all(18.0),
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 2.0,
                // TODO: dynamic Search
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

            //  Shop Categories
            list.when(data: (data) {
// run optional logic if need be;
              if (data != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: shopCategory
                      .map((e) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 12.0),
                            color: accentColor,
                            // alignme,
                            height: screen.height * 0.1475,
                            child: InkWell(
                              onTap: () => switchPages(context, e, data.data),
                              splashColor: Color(0xffffb6c1),
                              child: Row(
                                children: [
                                  Container(
                                    width: screen.width * 0.4,
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      e['title'],
                                      style: textTheme.headline6
                                          .copyWith(height: 1.3),
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset('assets/images/${e['imgName']}'),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              }
              return Center(
                  child: Text('Oops! We couldn\'t find any category',
                      style: TextStyle(color: Colors.orange)));
            }, loading: () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: shopCategory
                    .map((e) => Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        color: accentColor,
                        // alignme,
                        height: screen.height * 0.1475,
                        child: CircularProgressIndicator()))
                    .toList(),
              );
            }, error: (err, stack) {
              // print(err.toString());
              return Container(
                child: Text('Oops! An error occured!'),
              );
            }),
          ],
        ),
      ),
    );
  }

  // switch pages
  void switchPages(BuildContext context, e, List<Category> list) {
    switch (e['slug']) {
      case 'hair-care':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'hair-color':
        // final list = listOption.hairColor();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'hair-styling-tools':
        // final list = listOption.hairStyling();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'tools-and-accessories':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'makup-nails-tools':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'extension-wigs-accessories':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'gift-items':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      case 'brands':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShopCategoryPage(
                categoryTitle: e['title'],
                slug: e['slug'],
                categoryList: list)));
        break;
      default:
    }
  }
}
