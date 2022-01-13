import 'dart:ffi';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:better_player/better_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final pathFileVideo = "".obs;
  final pathFileAudio = "".obs;
  late AssetsAudioPlayer asset;
  final abc = "ggg".obs;
  final playSpeed = 1.0.obs;
  final index = 0.obs;
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
    asset =  AssetsAudioPlayer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<File?> pickerFile(pathFile, types)async{
    final result = await FilePicker.platform.pickFiles(type: types);
    if(result == null) return File(pathFile);
    return File(result.files.single.path!);
  }

  void chooseFileVideo()async{
    final result = await pickerFile(this.pathFileVideo.value,FileType.video);
    if(result == null) return;
    this.pathFileVideo.value = result.toString();
    print("abc....${this.pathFileVideo}");
  }

  void fastRewind()async{
    await asset.seekBy(Duration(seconds: -1));
  }

  void fastForward()async{
    await asset.seekBy(Duration(seconds: 1));
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

  void playAudio()async{
    try {
      final currentPosition = asset.currentPosition.value.toString();
      if(!asset.isPlaying.value){
        await asset.open(
            Audio("assets/audios/CaCanCau.mp3"),
            respectSilentMode: true
        );
        if(currentPosition != "0:00:00.000000"){
          asset.seek(Duration(hours: int.parse(currentPosition.replaceAll(":", "").substring(0,1)),
              minutes: int.parse(currentPosition.replaceAll(":", "").substring(1,3)),
              seconds: int.parse(currentPosition.replaceAll(":", "").substring(3,5))));
        }
      }else{
        asset.stop();
      }
    } catch (t) {
      //mp3 unreachable
    }
  }

  List<BetterPlayerDataSource> createDataSet() {
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
    );
    return dataSourceList;
  }

  void video(int index){
    print(dataSourceList.length);
    betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: dataSourceList[index]);
  }
}
