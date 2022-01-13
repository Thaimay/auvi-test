import 'package:auvi_test/app/modules/home/views/video_player_view.dart';
import 'package:auvi_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'audio_player_view.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () => Get.to(VideoPlayerView()),
            child: const Text("Video Player")),
            ElevatedButton(
                onPressed: () => Get.to(AudioPlayerView()),
                child: const Text("Audio Player")),
          ],
        ),
      )
    );
  }
}
