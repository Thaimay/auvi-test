import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/audio_controller.dart';

class AudioView extends GetView<AudioController> {
  const AudioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioView'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Obx(() => AudioWidget.assets(
          path: "assets/audios/CaCanCau.mp3",
          play: controller.play.value,
          child: MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                controller.play.value ? "pause" : "play",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () =>
              controller.play.value = !controller.play.value),
        )),
      ),
    );
  }
}
