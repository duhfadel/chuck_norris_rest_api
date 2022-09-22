import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key? key, required this.text, required this.avatar})
      : super(key: key);

  String text;
  String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: SvgPicture.network(
                'https://avatars.dicebear.com/api/avataaars/$avatar.svg'),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
