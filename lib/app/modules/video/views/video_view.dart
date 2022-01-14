import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoView'),
        centerTitle: true,
      ),
      body: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayerPlaylist(
            betterPlayerPlaylistConfiguration:
                const BetterPlayerPlaylistConfiguration(loopVideos: true),
            betterPlayerConfiguration: const BetterPlayerConfiguration(
                autoPlay: true, aspectRatio: 16 / 9),
            betterPlayerDataSourceList: controller.createDataSet(),
          )),
    );
  }
}
