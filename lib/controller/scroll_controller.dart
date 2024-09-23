import 'package:get/get.dart';

class ScrollController extends GetxController{
  // Store scroll position for each item individually
  var scrollPositions = 0.0.obs;
  var itemWidth = 980.obs; // Larger than screen width
  var maxScrollOffset = -( 980- Get.width).obs;


}