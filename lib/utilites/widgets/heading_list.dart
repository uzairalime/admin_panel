import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadingList extends StatelessWidget {
  const HeadingList({super.key});

  @override
  Widget build(BuildContext context) {
    // CheckboxController checkboxController = Get.put(CheckboxController());
    return Container(
      width: 980,
      height: Get.height * 0.07,
      decoration: BoxDecoration(color: greyColor.withOpacity(0.1)),
      child: Row(
        children: [
          Container(
            width: Get.width * 0.28,
            padding: EdgeInsets.symmetric(
                horizontal: paddingsm, vertical: paddingmd),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ID",
                  style: blacktextStyle,
                )
              ],
            ),
          ),
          Container(
            width: Get.width * 0.55,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: paddingsm, vertical: paddingmd),
            child: Text(
              "Campaign",
              style: blacktextStyle,
            ),
          ),
          Container(
            width: Get.width * 0.4,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: paddinglr, vertical: paddingmd),
            child: Text(
              "Created By",
              style: blacktextStyle,
            ),
          ),
          Container(
            width: Get.width * 0.35,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: paddinglr, vertical: paddingmd),
            child: Text(
              "Start Date",
              style: blacktextStyle,
            ),
          ),
          Container(
            width: Get.width * 0.35,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: paddinglr, vertical: paddingmd),
            child: Text(
              "End Date",
              style: blacktextStyle,
            ),
          ),
          Container(
            width: Get.width * 0.4,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: paddingsm, vertical: 0),
            child: Text(
              "Status",
              style: blacktextStyle,
            ),
          ),
          Container(
            width: Get.width * 0.35,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(paddingmd),
            child: Text("Action", style: blacktextStyle),
          ),
        ],
      ),
    );
  }
}
