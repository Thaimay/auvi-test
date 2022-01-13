import 'package:get/get.dart';

import '../controllers/run_audio_controller.dart';

class RunAudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RunAudioController>(
      () => RunAudioController(),
    );
  }
}
