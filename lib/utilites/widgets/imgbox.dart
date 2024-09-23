import 'package:admin_panal/utilites/dim.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imgbox extends StatelessWidget {
  const Imgbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.1,
      width: Get.width * 0.1,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(radiusmd),
      ),
      
    );
  }
}