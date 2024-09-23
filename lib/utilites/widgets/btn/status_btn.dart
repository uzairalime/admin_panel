import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusActiveBtn extends StatelessWidget {
  const StatusActiveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: paddingsm, vertical: 0),
      // margin: EdgeInsets.symmetric(horizontal: paddingsm, vertical: paddingsm),
      decoration: BoxDecoration(
        color: lightgreen,
        borderRadius: BorderRadius.circular(radiusmd),
      ),
      child: Text(
        "Active",
        style: greentextStyle,
      ),
    );
  }
}

//
class StatusInactiveBtn extends StatelessWidget {
  const StatusInactiveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: paddingsm, vertical: paddingsm),
      decoration: BoxDecoration(
        color: lightred,
        borderRadius: BorderRadius.circular(radiusmd),
      ),
      child: Text(
        "Inactive",
        style: redtextStyle,
      ),
    );
  }
}
