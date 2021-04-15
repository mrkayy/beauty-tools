import 'package:flutter/material.dart';

import '../../../models/models.dart';

Widget profileListCard(CommonList list) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: '${list.title}', style: TextStyle(color: Color(0xff273444))),
        TextSpan(
            text: '${list.desc}', style: TextStyle(color: Color(0xff273444))),
      ],
    ),
  );
}
