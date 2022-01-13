import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auvi/app/modules/audio/controllers/audio_controller.dart';
import 'package:get/get.dart';

class RunAudioController extends GetxController {
  //TODO: Implement RunAudioController
  final AudioController audioController = Get.find();
  var data = Get.arguments;

  AssetsAudioPlayer  assetsAudioPlayer = AssetsAudioPlayer();
  final RxBool play = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // checkAudio();
  }

  @override
  void onClose() {
    assetsAudioPlayer.dispose();
  }

  void increment() => count.value++;

  void check(value) {
    if (value == 1) {
      if (data > audioController.audiosList.length - 1) {
        return;
      }
      data++;
    } else {
      if (data < 1) {
        return;
      }
      data--;
    }
  }
}
