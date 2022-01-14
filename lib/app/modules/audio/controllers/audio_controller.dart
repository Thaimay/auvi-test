import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  late AssetsAudioPlayer assetsAudioPlayer;

  final index = 0.obs;

  final RxBool play = false.obs;

  final audioList = [
    Audio('assets/audios/CaCanCau.mp3'),
    Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
    Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"),
    Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"),
    Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3")
  ];

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    assetsAudioPlayer = AssetsAudioPlayer();
    dataAudio();
  }

  @override
  void onReady() {
    super.onReady();
    check();
  }

  @override
  void onClose() {
    assetsAudioPlayer.dispose();
  }

  void dataAudio() async {
    try {
      final position = assetsAudioPlayer.currentPosition.value.toString();
      if (!assetsAudioPlayer.isPlaying.value) {
        await assetsAudioPlayer.open(
          Playlist(startIndex: index.value, audios: audioList),
          loopMode: LoopMode.playlist,
          autoStart: true,
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
          showNotification: true,
        );

        if (position != "0:00:00.000000") {
          assetsAudioPlayer.seek(Duration(
              hours: int.parse(position.replaceAll(":", "").substring(0, 1)),
              minutes: int.parse(position.replaceAll(":", "").substring(1, 3)),
              seconds:
                  int.parse(position.replaceAll(":", "").substring(3, 5))));
        }
      } else {
        assetsAudioPlayer.pause();
      }
    } catch (e) {}
  }

  void checkNextAudio() async {
    if (index.value < audioList.length - 1) {
      index.value = ++index.value;
      await assetsAudioPlayer.next();
    }
  }

  void checkPreAudio() async {
    if (index.value > 0) {
      index.value = --index.value;
      await assetsAudioPlayer.previous();
    }
  }

  void checkRewind() async {
    await assetsAudioPlayer.seekBy(const Duration(seconds: -10));
  }

  void checkForward() async {
    await assetsAudioPlayer.seekBy(const Duration(seconds: 10));
  }

  void check() {
    AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
      return true;
    });
  }
}
