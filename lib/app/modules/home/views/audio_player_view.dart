import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auvi_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AudioPlayerView extends StatelessWidget {
  HomeController controller = Get.find();

  AudioPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioPlayerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                  child: const Icon(Icons.fast_rewind),
                  onPressed: () => controller.fastRewind()),
              CupertinoButton(
                  child: PlayerBuilder.isPlaying(
                      player: controller.asset,
                      builder: (context,isPlaying){
                        return Icon(isPlaying ? Icons.pause : Icons.play_arrow);
                      }),
                  onPressed: () => controller.playAudio()),
              CupertinoButton(
                  child: const Icon(Icons.fast_forward),
                  onPressed: () => controller.fastForward()),
              PlayerBuilder.currentPosition(
                  player: controller.asset,
                  builder: (context, duration) {
                    return Text(duration.toString().substring(0,7));
                  }
              ),
              CupertinoButton(
                  child: const Icon(Icons.rotate_left_outlined),
                  onPressed: () => controller.deceleration()),
              Obx(() => Text("${controller.playSpeed.value}x")),
              CupertinoButton(
                  child: const Icon(Icons.rotate_right),
                  onPressed: () => controller.speedUp()),
            ],
          ),
        ),
      )
    );
  }
}
