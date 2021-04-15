import 'package:flutter/material.dart';
import '../../../shared/shared_widgets.dart';
import '../../screens.dart';
import '../../../../models/models.dart';

class ShopCategoryPage extends StatelessWidget {
  ShopCategoryPage({this.categoryTitle, this.slug, this.categoryList});

  final String categoryTitle;
  final String slug;
  final List<Category> categoryList;

 List<<Sting,dynamic>> currentCategory = [];

// void getCurrentList(){
//  categoryList.forEach(e=>
// if(slug == e.menu){

//  currentCategory.add({'categroy':e.category,
 
//  }) ;
// }

//  );

// }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    print(categoryTitle);
    return Scaffold(
      appBar: customAppBar(categoryTitle),
      body: Container(
        child: ListView(
          children: categoryList.map((e) {

            return InkWell(
              splashColor: Color(0xffffb6c1),
              highlightColor: Colors.grey.shade100,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProductsListScreen(products: e.category)));
              },
              child: Container(
                padding: const EdgeInsets.all(21.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffffb6c1), width: 1.0),
                  ),
                ),
                child: Text(
                  slug == e.menu?
                  e.category:'',
                  style:
                      textTheme.headline6.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
