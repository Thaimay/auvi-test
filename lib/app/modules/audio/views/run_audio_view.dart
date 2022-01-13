import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/run_audio_controller.dart';

class RunAudioView extends GetView<RunAudioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RunAudioView'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: Get.height/2.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetX<RunAudioController>(builder: (_) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          _.audioController.audiosList[_.data]
                              .metas.image!.path,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Tên: ${_.audioController.audiosList[_.data].metas.title}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nghệ sĩ: ${_.audioController.audiosList[_.data].metas.artist}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        _.audioController.audiosList[_.data]
                                    .metas.album !=
                                ""
                            ? Text(
                                "Album: ${_.audioController.audiosList[_.data].metas.album}",
                                style: const TextStyle(fontSize: 16),
                              )
                            : Container(),
                        _.assetsAudioPlayer.builderCurrentPosition(
                            builder: (context, duration) {
                              return Text(duration.toString());
                            }
                        )
                      ],
                    ),
                  )),
                  const Spacer(),
                  Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.black))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: ()  => controller.check(2),
                            child: const Icon(
                              Icons.skip_previous_rounded,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Obx(
                            () => AudioWidget.assets(
                              path: controller.audioController
                                  .audiosList[controller.data].path,
                              play: controller.play.value,
                              child: InkWell(
                                onTap: () => controller.play.value =
                                    !controller.play.value,
                                child: Icon(
                                  controller.play.value
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () => controller.check(1),
                            child: const Icon(
                              Icons.skip_next_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      )),
                ]))));
  }
}
