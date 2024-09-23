import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var checkboxValues = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    checkboxValues.assignAll(List.generate(50, (index) => false)); // Initialize checkbox values
  }

  void toggleCheckbox(int index, bool value) {
    checkboxValues[index] = value; // Update the checkbox value
  }
}
