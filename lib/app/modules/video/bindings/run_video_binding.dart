import 'package:get/get.dart';

import '../controllers/run_video_controller.dart';

class RunVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RunVideoController>(
      () => RunVideoController(),
    );
  }
}
