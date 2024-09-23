import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';
import 'package:admin_panal/utilites/widgets/btn/status_btn.dart';
import 'package:admin_panal/utilites/widgets/icon.dart';
import 'package:admin_panal/utilites/widgets/imgbox.dart';

class DataList extends StatelessWidget {
  final isSelected;
  void Function(bool?)? onSelected;
  final itemNo;
  final campPath;
  final campName;
  final createrName;
  final createrNum;
  final startDate;
  final endDate;
  final status;
  Color editIconColor;
  Function()? onEdit;
  Color viewIconColor;
  Function()? onView;
  Color deleteIconColor;
  Function()? onDelete;

  DataList({
    Key? key,
    required this.onSelected,
    required this.editIconColor,
    required this.onEdit,
    required this.onView,
    required this.viewIconColor,
    required this.deleteIconColor,
    required this.onDelete,
    required this.isSelected,
    required this.itemNo,
    this.campPath,
    required this.campName,
    required this.createrName,
    required this.createrNum,
    required this.startDate,
    required this.endDate,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Get.width * 0.32,
          padding:
              EdgeInsets.symmetric(horizontal: paddingsm, vertical: paddingmd),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                side: BorderSide(color: greyColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiussm),
                ),
                value: isSelected,
                onChanged: onSelected,
              ),
              Text(
                itemNo,
                style: subtextStyle,
              )
            ],
          ),
        ),
        Container(
          width: Get.width * 0.55,
          padding:
              EdgeInsets.symmetric(horizontal: paddingsm, vertical: paddingmd),
          child: Row(
            children: [
              const Imgbox(),
              const SizedBox(width: 10),
              Text(campName, style: blacktextStyle),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.4,
          padding:
              EdgeInsets.symmetric(horizontal: paddinglr, vertical: paddingmd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(createrName, style: blacktextStyle),
              const SizedBox(height: 5),
              Text(createrNum, style: subtextStyle),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.35,
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(horizontal: paddinglr, vertical: paddingmd),
          child: Text(startDate, style: greytextStyle),
        ),
        Container(
          width: Get.width * 0.35,
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(horizontal: paddinglr, vertical: paddingmd),
          child: Text(endDate, style: greytextStyle),
        ),
        const StatusActiveBtn(),
        Container(
          width: Get.width * 0.4,
          padding: EdgeInsets.all(paddingmd),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(
                icon: Icons.edit,
                color: editIconColor,
                onTap: onEdit,
              ),
              const SizedBox(width: 5),
              CustomIcon(
                icon: Icons.remove_red_eye,
                color: viewIconColor,
                onTap: onView,
              ),
              const SizedBox(width: 5),
              CustomIcon(
                icon: Icons.delete,
                color: deleteIconColor,
                onTap: onDelete,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
