// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';

class CustomIcon extends StatelessWidget {
  IconData icon;
  Function()? onTap;
  Color? color;
  CustomIcon({
    Key? key,
    required this.icon,
    required this.onTap,
     this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color:color?? greyColor,
          size: fontsizex,
        ));
  }
}
