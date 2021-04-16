import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountProfile extends ConsumerWidget {
  AccountProfile({
    @required this.icon,
    @required this.title,
    @required this.desc,
  });

  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final textTheme = Theme.of(context).textTheme;
    return ExpansionTile(
      // tilePadding: const EdgeInsets.only(top:10),
      leading: Icon(
        icon,
        size: 36.0,
      ),
      title: Text(
        title,
        style: textTheme.headline6
            .copyWith(fontWeight: FontWeight.w300, fontSize: 24.0),
      ),
      subtitle: Text(desc),
      children: <Widget>[],
    );
  }
}
