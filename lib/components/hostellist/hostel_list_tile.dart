// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HostelListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl; // New property for the image URL

  HostelListTile({required this.title, required this.subTitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      avatar: GFAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(imageUrl), // Use the NetworkImage here
      ),
      titleText: title,
      subTitleText: subTitle,
    );
  }
}

