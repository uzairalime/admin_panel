import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class PaginationController extends GetxController{
  RxList<String> data = List<String>.generate(50, (index) => 'Item $index').obs;

  // Pagination control variables
  RxInt startIndex = 0.obs;
  RxInt itemsPerPage = 5.obs;
  RxInt buttonsToShow = 5.obs; // Number of buttons initially visible
  RxInt endIndex = 0.obs;
  RxInt i =0.obs;
  // RxInt items = 0.obs;

  @override
  void onInit() {
    super.onInit();
    endIndexFunction(); // Ensure endIndex is calculated during init
    // itemcount(); // Calculate initial item count
    log("Initial items count: ${endIndex.value - startIndex.value}");
  }
  // void itemcount() {
  //   items.value = endIndex.value - startIndex.value;
  // }

  // oninit(){
  //   itemcount();
  //   // endIndexFunction();
  //   log("-------------------------------${items.value.toString()}");

  // }

  // RxInt itemcount = (endIndex.value + startIndex).obs;
  // void itemcount(){
  //   items = (endIndex - startIndex.value);
  // }


  // Forward and Backward functions
  void forward(){
    if (startIndex.value + itemsPerPage.value < data.length) {
      startIndex.value += itemsPerPage.value;
    }
  }
  void backward(){
    if (startIndex.value - itemsPerPage.value >= 0) {
      startIndex.value -= itemsPerPage.value;
      endIndexFunction();
    }
  }
  
  // end index function
  void endIndexFunction(){
    endIndex.value = (startIndex.value + itemsPerPage.value > data.length)
        ? data.length
        : startIndex.value + itemsPerPage.value;
    // itemcount(); // Update the item count after adjusting the endIndex
  }
  // button function
  void buttonShow(){
    startIndex.value = i.value * itemsPerPage.value;
    log("message------------------${startIndex.value}");
  }
  void btnPressed(){
    startIndex.value = i.value * itemsPerPage.value;
    log("page ${startIndex.value.toString()}");

  }
  
  // Function to load more buttons
  void viewMoreButtons(totalPages){
    buttonsToShow.value = (buttonsToShow.value + 5 > data.length)
        ? data.length
        : buttonsToShow.value + 5;
  }

  
}