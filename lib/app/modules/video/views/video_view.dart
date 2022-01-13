import 'package:auvi/app/modules/video/views/compoments/item_video.dart';
import 'package:auvi/app/routes/app_pages.dart';
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
        body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.videoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemVideo(
                    image: controller.videoList[index].image,
                    name: controller.videoList[index].name,
                    time: controller.videoList[index].time,
                    onTap: () => Get.toNamed(Routes.RUN_VIDEO,
                        arguments: index),
                  ),
                );
              }),
        );
  }
}
