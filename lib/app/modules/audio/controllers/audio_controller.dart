import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  //TODO: Implement AudioController
  final RxBool play = false.obs;

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
