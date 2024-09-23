import 'dart:developer';
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxInt counter = 5.obs;
  
  // List of checkbox values
  var checkboxValues = List<bool>.generate(50, (_) => false).obs;

  // Toggle the checkbox value
  void toggleCheckbox(int index, bool value) {
    checkboxValues[index] = value;
    log(value.toString());
  }
  void increment() {
    counter += 5;
    log(counter.value.toString());
    // log(counter.value.toString());
  }
  void decrement() {
    counter -= 5;
    log(counter.value.toString());
    // log(counter.value.toString());
  }
}