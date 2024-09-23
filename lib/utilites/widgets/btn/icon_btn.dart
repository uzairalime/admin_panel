import 'package:flutter/material.dart';
import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:flutter/widgets.dart';

class IconBtn extends StatelessWidget {
  Function()? onTap;
  String iconPath;
  IconBtn({
    super.key,
    this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: paddinglr+3, vertical: paddinglr),
        decoration: BoxDecoration(
          color: lightpurple,
          borderRadius: BorderRadius.circular(radiuslr),
        ),
        child: Image.asset(iconPath,width:8,),
      ),
    );
  }
}
