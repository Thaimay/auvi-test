import 'package:get/get.dart';

class RunVideoController extends GetxController {
  //TODO: Implement RunVideoController
  var data = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
