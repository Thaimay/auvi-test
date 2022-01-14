import 'dart:ffi';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:better_player/better_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  late AssetsAudioPlayer asset;
  final playSpeed = 1.0.obs;
  final index = 0.obs;
  int indexAudio = 0;
  final isLoading = true.obs;
  final image = <String>[
    "https://upload.wikimedia.org/wikipedia/commons/e/e4/Elephants_Dream_cover.jpg",
    "https://www.blendernation.com/wp-content/uploads/2008/05/afbeelding-1.png",
    "https://i.ytimg.com/vi/TKMj7eZ_rD0/maxresdefault.jpg",
    "https://vbcdn.com/cdn/download/2013072513747482321992901633.jpg",
    "https://i.ytimg.com/vi/0uzxLlqtJ2c/maxresdefault.jpg"
  ];
  final dataSourceList = <BetterPlayerDataSource>[];
  late BetterPlayerController betterPlayerController;

  @override
  void onInit() {
    initDataVideo();
    loadDataVideo();
    asset =  AssetsAudioPlayer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // Future<File?> pickerFile(pathFile, types)async{
  //   final result = await FilePicker.platform.pickFiles(type: types);
  //   if(result == null) return File(pathFile);
  //   return File(result.files.single.path!);
  // }

  // void chooseFileVideo()async{
  //   final result = await pickerFile(pathFileVideo.value,FileType.video);
  //   if(result == null) return;
  //   pathFileVideo.value = result.toString();
  //   print("abc....$pathFileVideo");
  // }

  void fastRewind()async{
    await asset.seekBy(const Duration(seconds: -1));
  }

  void fastForward()async{
    await asset.seekBy(const Duration(seconds: 1));
  }

  void speedUp(){
    playSpeed.value = ++playSpeed.value;
    asset.setPlaySpeed(playSpeed.value);
  }

  void deceleration(){
    if(playSpeed.value != 1.0){
      playSpeed.value = --playSpeed.value;
      asset.setPlaySpeed(playSpeed.value);
    }
  }

  void previousAudio()async{
    if(indexAudio != 0){
      isLoading.value = false;
      indexAudio = --indexAudio;
      await asset.previous();
      isLoading.value = true;
    }
  }

  void nextAudio()async{
    if(indexAudio != 3){
      isLoading.value = false;
      indexAudio = ++indexAudio;
      await asset.next();
      isLoading.value = true;
    }
  }

  void playAudio()async{
    isLoading.value = false;
    try {
      final currentPosition = asset.currentPosition.value.toString();
      if(!asset.isPlaying.value){
        await asset.open(
            Playlist(
              startIndex: indexAudio,
              audios: [
                Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
                Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"),
                Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"),
                Audio.network("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"),
              ]
            ),
            respectSilentMode: true,
            loopMode: LoopMode.playlist
        );
        isLoading.value = true;
        if(currentPosition != "0:00:00.000000"){
          asset.seek(Duration(hours: int.parse(currentPosition.replaceAll(":", "").substring(0,1)),
              minutes: int.parse(currentPosition.replaceAll(":", "").substring(1,3)),
              seconds: int.parse(currentPosition.replaceAll(":", "").substring(3,5))));
          isLoading.value = true;
        }
      }else{
        asset.pause();
        isLoading.value = true;
      }
    } catch (t) {
      //mp3 unreachable
    }
  }

  void initDataVideo(){
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
      ),
    );

    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
      ),
    );

    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"),
    );

    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8"),
    );

    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"),
    );
  }

  void playVideo(int index){
    betterPlayerController.pause();
    this.index.value = index;
    loadDataVideo();
  }

  void loadDataVideo(){
    betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(),
        betterPlayerDataSource: dataSourceList[index.value]);
  }
}
