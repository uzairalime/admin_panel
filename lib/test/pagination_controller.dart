import 'package:get/get.dart';

class PaginationController extends GetxController{
  // Pagination control variables
  var startIndex = 0.obs;
  var itemsPerPage = 5.obs;
  var currentPage = 0.obs;
  var buttonsToShow = 3.obs;
  RxBool isViewMore = true.obs;
  RxList<String> data = List<String>.generate(100, (index) => 'Item $index').obs;

  // Forward navigation Fuction
  void forward() {
    if (currentPage.value + 1 < totalPages()) {
        currentPage.value++; // Move to the next page
        startIndex.value = currentPage.value * itemsPerPage.value; // Update the start index

        if (currentPage.value >= buttonsToShow.value) {
          buttonsToShow.value += 3; // Automatically show the next set of buttons
        }
      }
  }
  // Backward navigation Function
  void backward() {
     if (currentPage.value > 0) {
        currentPage.value--; // Move to the previous page
        startIndex.value = currentPage.value * itemsPerPage.value; // Update the start index
        if (currentPage.value < buttonsToShow.value - 3 && buttonsToShow.value > 3) {
          buttonsToShow.value -= 3; // Automatically reduce the visible buttons
        }
      }
  }
  // Function to load more buttons
  void viewMoreButtons() {
    buttonsToShow.value += 3; // Show 3 more buttons
      if (buttonsToShow.value >= totalPages()) {
        buttonsToShow.value = totalPages(); // Cap it to the total number of pages
        isViewMore.value = false; // Switch to "View Less"
      }
  }
  // Function to revert back to showing only 3 buttons
  void viewLessButtons() {
    buttonsToShow.value = 3; // Reset to showing only 3 buttons
      currentPage.value = 0; // Reset to the first page
      startIndex.value = 0; // Reset the start index
      isViewMore.value = true; // Switch back to "View More"
  }
  // Function to calculate the total number of pages
  int totalPages() {
    return (data.length / itemsPerPage.value).ceil(); // Total number of pages
  }
  // Function to navigate to a specific page
  void goToPage(int page) {
    currentPage.value = page; // Move to the selected page
    startIndex.value = currentPage.value * itemsPerPage.value; // Update the start index
  }
  // Fuction get end index
  int endIndex() {
    return (startIndex.value + itemsPerPage.value > data.length)? data.length : startIndex.value + itemsPerPage.value;
  }

}