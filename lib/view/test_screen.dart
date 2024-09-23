import 'dart:developer';
import 'package:admin_panal/controller/checkbox_controller.dart';
import 'package:admin_panal/test/pagination_controller.dart';
import 'package:admin_panal/utilites/colors.dart';
import 'package:admin_panal/utilites/dim.dart';
import 'package:admin_panal/utilites/textstyle.dart';
import 'package:admin_panal/utilites/widgets/data_list.dart';
import 'package:admin_panal/utilites/widgets/heading_list.dart';
import 'package:admin_panal/utilites/widgets/btn/icon_btn.dart';
import 'package:admin_panal/utilites/widgets/btn/icontext_btn.dart';
import 'package:admin_panal/utilites/widgets/btn/page_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  CheckboxController checkboxController = Get.put(CheckboxController());
  PaginationController paginationController = Get.put(PaginationController());

  // Store scroll position for each item individually
  double _scrollPositions = 0.0;
  final double _itemWidth = 980; // Larger than screen width

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxScrollOffset = -(_itemWidth - screenWidth);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          //================================ search field ==============================
          Container(
            margin: const EdgeInsets.all(10),
            width: Get.width * 0.9,
            height: 50,
            padding: EdgeInsets.all(paddingmd),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(radiuslr),
                border: Border.all(color: borderColor, width: 0.5)),
            child: TextFormField(
              decoration: InputDecoration(
                // disabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: "Search Campaigns",
                hintStyle: greytextStyle,
                suffixIcon: Icon(
                  Icons.search,
                  color: greyColor,
                  size: fontsizex,
                ),
              ),
            ),
          ),
          // list of buttons
          Wrap(
            spacing: 10,
            children: [
              IcontextBtn(text: "Date", icon: Icons.calendar_month),
              IcontextBtn(text: "Date", icon: Icons.calendar_month),
              IcontextBtn(text: "All", icon: Icons.filter_list_rounded),
            ],
          ),
          //================================ Heading List ==============================
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                // Update the scroll position and clamp it within valid range
                _scrollPositions += details.delta.dx;
                _scrollPositions = _scrollPositions.clamp(maxScrollOffset, 0.0);
              });
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable default scrolling
              child: Transform.translate(
                  offset: Offset(_scrollPositions, 0),
                  child: const HeadingList()),
            ),
          ),
          //================================ List of items ==============================
          SizedBox(
            height: 75 * paginationController.itemsPerPage.toDouble(),
            child: ListView.builder(
              itemCount: paginationController.endIndex() -
                  paginationController.startIndex.value,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _scrollPositions += details.delta.dx;
                      _scrollPositions =
                          _scrollPositions.clamp(maxScrollOffset, 0.0);
                    });
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Transform.translate(
                        offset: Offset(_scrollPositions, 0),
                        child: Obx(
                          () => Container(
                              width: _itemWidth,
                              height: 75,
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: lightgrey, width: 0.5)),
                              ),
                              child: DataList(
                                onSelected: (value) {
                                  checkboxController.toggleCheckbox(
                                      paginationController.startIndex.value +
                                          index,
                                      value!);
                                },
                                isSelected: checkboxController.checkboxValues[
                                    paginationController.startIndex.value +
                                        index],
                                itemNo:
                                    " Item ${paginationController.startIndex.value + index + 1}",
                                // campPath: campPath,
                                campName: "User Engagement",
                                createrName: "Vicktor Alex",
                                createrNum: "+1(650) 230-3030",
                                startDate: "20 Aug 2024",
                                endDate: "20 Aug 2024",
                                // status: status,
                                editIconColor: checkboxController
                                            .checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? Colors.black
                                    : Colors.grey,
                                onEdit: checkboxController.checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? () => log("edit clicked")
                                    : null, // Disable if unchecked,
                                viewIconColor: checkboxController
                                            .checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? Colors.black
                                    : Colors.grey,
                                onView: checkboxController.checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? () => log("view clicked")
                                    : null, // Disable if unchecked,
                                deleteIconColor: checkboxController
                                            .checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? Colors.black
                                    : Colors.grey,
                                onDelete: checkboxController.checkboxValues[
                                        paginationController.startIndex.value +
                                            index]
                                    ? () => log("delete clicked")
                                    : null, // Disable if unchecked
                              )),
                        )),
                  ),
                );
              },
            ),
          ),
          //================================ Pagination Buttons ==============================

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Wrap(
                    spacing: 10,
                    children: [
                      IconBtn(
                        iconPath: 'assets/images/backarrow_icon.png',
                        onTap: () => paginationController.backward(),
                      ),
                      for (int i = 0;
                          i < paginationController.buttonsToShow.value &&
                              i < paginationController.totalPages();
                          i++)
                        PageBtn(
                          isActive: paginationController.currentPage == i,
                          name: "${i + 1}",
                          onTap: () => paginationController.goToPage(i),
                        ),
                      // Show View Less button when all items are displayed
                      if (paginationController.buttonsToShow.value >=
                          paginationController.totalPages())
                        PageBtn(
                          isActive: false,
                          name: "View Less",
                          onTap: paginationController.viewLessButtons,
                        ),
                      // Show View More button only if there are more pages
                      if (paginationController.buttonsToShow.value <
                          paginationController.totalPages())
                        PageBtn(
                          isActive: false,
                          name: "...",
                          onTap: paginationController.viewMoreButtons,
                        ),
                      IconBtn(
                        iconPath: 'assets/images/forwardarrow_icon.png',
                        onTap: () => paginationController.forward(),
                      ),
                    ],
                  ),
                )),
          ),
          //================================ Showing items count ==============================
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Showing ${paginationController.startIndex.value + 1}-${paginationController.endIndex()} from ${paginationController.data.length}",
              style: subtextStyle,
            ),
          ),
        ],
      )),
    );
  }
}
