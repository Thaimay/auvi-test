import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
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
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.assetsAudioPlayer.builderCurrent(
                      builder: (BuildContext context, Playing playing) {
                        final myAudio = controller.find(
                            controller.audioList, playing.audio.assetAudioPath);
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(
                                  myAudio.metas.image!.path,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      myAudio.metas.title!,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      myAudio.metas.artist!,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                myAudio.metas.album! != ""
                                    ? Text(
                                        myAudio.metas.album!,
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    : Container(),
                              ],
                            ));
                      },
                    ),
                    PlayerBuilder.currentPosition(
                        player: controller.assetsAudioPlayer,
                        builder: (context, duration) {
                          return Text(duration.toString().substring(0, 7));
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => controller.checkPreAudio(),
                          child: const Icon(
                            Icons.skip_previous_rounded,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          child: const Icon(
                            CupertinoIcons.backward_fill,
                            size: 25,
                          ),
                          onTap: () => controller.checkRewind(),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                            onTap: () => controller.dataAudio(),
                            child: PlayerBuilder.isPlaying(
                                player: controller.assetsAudioPlayer,
                                builder: (context, isPlaying) {
                                  return Icon(
                                    isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    size: 25,
                                  );
                                })),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          child: const Icon(
                            CupertinoIcons.forward_fill,
                            size: 25,
                          ),
                          onTap: () => controller.checkForward(),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () => controller.checkNextAudio(),
                          child: const Icon(
                            Icons.skip_next_rounded,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
