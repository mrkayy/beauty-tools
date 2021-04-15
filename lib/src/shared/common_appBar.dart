import 'package:flutter/Material.dart';


Widget customAppBar (String barTitle){
   return AppBar(
      iconTheme: IconThemeData(
         color: Color(0xff273444)
      ),
      centerTitle: true,
      title: Text(barTitle),
      backgroundColor: Colors.white,
      elevation: 1.0,
    );
}

