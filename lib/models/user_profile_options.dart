import 'package:flutter/widgets.dart';
import './models.dart';

class UserProfileOptions {
  bool isExpanded;
  String title;
  String desc;
  IconData icon;
  List<CommonList> list;

  UserProfileOptions({this.icon, this.desc, this.title, this.isExpanded, this.list}) {
    this.isExpanded = false;
    // this.desc = 'click here';
  }
}
