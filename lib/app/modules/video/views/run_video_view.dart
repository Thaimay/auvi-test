import 'package:auvi/app/modules/video/controllers/video_controller.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/run_video_controller.dart';

class RunVideoView extends GetView<RunVideoController> {
  RunVideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VideoController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(_.videoList[controller.data].name),
                centerTitle: true,
              ),
              body: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayer.network(
                    _.videoList[controller.data].file,
                    betterPlayerConfiguration: const BetterPlayerConfiguration(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                    ),
                  )),
            ));
  }
}
