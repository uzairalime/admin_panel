import 'package:flutter/material.dart';
import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';

class PageBtn extends StatelessWidget {
  bool isActive;
  Function()? onTap;
  String name;
  PageBtn({
    super.key,
    required this.isActive,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: paddinglr, vertical: paddingmd),
        decoration: BoxDecoration(
          // color: secondryColor,
          color: isActive ? primaryColor : lightpurple,
          borderRadius: BorderRadius.circular(radiuslr),
        ),
        child: Text(
          name,
          style: isActive
              ? blacktextStyle.copyWith(color: Colors.white)
              : blacktextStyle.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
