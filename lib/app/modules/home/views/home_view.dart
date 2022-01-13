import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:better_player/better_player.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetX<HomeController>(builder: (_){
            if(_.pathFileVideo.value != ""){
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer.file(
                  "${_.pathFileVideo.value}",
                  betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                  ),
                ),
              );
            }
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer.network(
                "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
                betterPlayerConfiguration: BetterPlayerConfiguration(
                  aspectRatio: 16 / 9,
                ),
              ),
            );
          }),
          TextButton(
              onPressed:() => controller.chooseFileVideo(),
              child: Text("chọn Video")),
          GetX<HomeController>(builder: (_){
            if(_.pathFileAudio.value != ""){
              return Obx(() => AudioWidget.file(
                path: "${_.pathFileAudio.value}",
                play: controller.play.value,
                child: TextButton(
                    child: Text(
                      controller.play.value ? "pause" : "play",
                      style: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () =>
                    controller.play.value = !controller.play.value),
              ));
            }
            return Obx(() => AudioWidget.assets(
              path: "assets/audios/CaCanCau.mp3",
              play: controller.play.value,
              child: TextButton(
                  child: Text(
                    controller.play.value ? "pause" : "play",
                    style: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () =>
                  controller.play.value = !controller.play.value),
            ));
          }),
          TextButton(
              onPressed:() => controller.chooseFileAudio(),
              child: Text("chọn Audio")),
        ],
      ),
    );
  }
}
