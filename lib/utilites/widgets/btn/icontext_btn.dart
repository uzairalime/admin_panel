// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';

class IcontextBtn extends StatelessWidget {
  String text;
  IconData icon;
  Function()? onTap;
   IcontextBtn({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddinglr, vertical: paddingmd),
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: paddingsm),

        decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(radiusmd),
            border: Border.all(color: borderColor, width: 1)),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Icon(
              icon,
              color: greyColor,
            ),
            Text(
              text,
              style: lightblackStyle,
            ),
          ],
        ),
      ),
    );
  }
}
