import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  //TODO: Implement AudioController

  final audiosList = <Audio>[
    Audio('assets/audios/CaCanCau.mp3',
        metas: Metas(
            title: 'Cá cắn câu',
            artist: 'Mlee ft Isaac',
            album: '',
            image: const MetasImage.network(
                'https://avatar-ex-swe.nixcdn.com/song/share/2020/09/24/f/a/f/2/1600913328907.jpg'))),
    Audio('assets/audios/CaCanCau.mp3',
        metas: Metas(
            title: 'Cá cắn câu 2',
            artist: 'Mlee ft Isaac',
            album: '',
            image: const MetasImage.network(
                'https://avatar-ex-swe.nixcdn.com/song/share/2020/09/24/f/a/f/2/1600913328907.jpg'))),
  ].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
