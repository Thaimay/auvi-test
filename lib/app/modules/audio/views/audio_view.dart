import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auvi/app/modules/audio/views/compoments/item_audio.dart';
import 'package:auvi/app/routes/app_pages.dart';
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
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.audiosList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemAudio(
                  image: "${controller.audiosList[index].metas.image?.path}",
                  name: "${controller.audiosList[index].metas.title}",
                  artist: "${controller.audiosList[index].metas.artist}",
                  album: "${controller.audiosList[index].metas.album}",
                  onTap: () => Get.toNamed(Routes.RUN_AUDIO,
                      arguments: index),
                ),
              );
            }),);
  }
}
