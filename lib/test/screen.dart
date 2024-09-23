// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'pagination_controller.dart';
// import 'checkbox_controller.dart';

// class Screen extends StatelessWidget {
//   final PaginationController paginationController = Get.put(PaginationController());
//   final CheckboxController checkboxController = Get.put(CheckboxController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Vertical List with Horizontal Scroll')),
//       body: Column(
//         children: [
//           // Your existing horizontal scrolling code here...
//           Obx(() {
//             int endIndex = (paginationController.startIndex.value + paginationController.itemsPerPage > paginationController.data.length)
//                 ? paginationController.data.length
//                 : paginationController.startIndex.value + paginationController.itemsPerPage;

//             return Container(
//               height: 75 * paginationController.itemsPerPage.toDouble(),
//               child: ListView.builder(
//                 itemCount: endIndex - paginationController.startIndex.value,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     children: [
//                       Obx(() => Checkbox(
//                         value: checkboxController.checkboxValues[paginationController.startIndex.value + index],
//                         onChanged: (value) {
//                           checkboxController.toggleCheckbox(paginationController.startIndex.value + index, value!);
//                         },
//                       )),
//                       Text(paginationController.data[paginationController.startIndex.value + index]),
//                       // Other widgets in your row...
//                     ],
//                   );
//                 },
//               ),
//             );
//           }),
//           // Pagination Buttons
//           Obx(() {
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   IconButton(icon: Icon(Icons.arrow_back), onPressed: paginationController.backward),
//                   for (int i = 0; i < paginationController.buttonsToShow.value; i++)
//                     TextButton(
//                       child: Text("${i + 1}"),
//                       onPressed: () {
//                         paginationController.currentPage.value = i;
//                         paginationController.startIndex.value = i * paginationController.itemsPerPage;
//                       },
//                     ),
//                   if (paginationController.isViewMore.value)
//                     TextButton(child: Text("..."), onPressed: paginationController.viewMoreButtons),
//                   if (!paginationController.isViewMore.value)
//                     TextButton(child: Text("View Less"), onPressed: paginationController.viewLessButtons),
//                   IconButton(icon: Icon(Icons.arrow_forward), onPressed: paginationController.forward),
//                 ],
//               ),
//             );
//           }),
//           // Showing items text...
//         ],
//       ),
//     );
//   }
// }
