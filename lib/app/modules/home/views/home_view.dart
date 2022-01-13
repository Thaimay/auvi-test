import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:better_player/better_player.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetX<HomeController>(builder: (_){
            if(_.pathFileVideo.value != ""){
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer.file(
                  "${_.pathFileVideo.value}",
                  betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                  ),
                ),
              );
            }
            return GetX<HomeController>(builder: (_){
              if(_.index.value == 0){
                return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayerPlaylist(
                        betterPlayerConfiguration: BetterPlayerConfiguration(),
                        betterPlayerPlaylistConfiguration: const BetterPlayerPlaylistConfiguration(),
                        betterPlayerDataSourceList:  _.createDataSet())
                );
              }
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: _.betterPlayerController,
                ),
              );
            });
          }),
          CupertinoButton(
            onPressed: () => controller.chooseFileVideo(),
            child: Row(
              children: [
                Icon(Icons.add),
                Text("chọn video")
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: controller.image.length,
                  itemBuilder: (context,index){
                  if(index == 0){
                    return Container();
                  }
                    return InkWell(
                      onTap: (){
                        controller.index.value = index;
                        controller.video(index);
                      },
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.network(controller.image[index]),
                              Container(
                                padding: EdgeInsets.only(top: 10,left: 15),
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black38
                                ),
                                child: Text("Video 0${index}",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20
                                ),),
                              )
                            ],
                          ),
                          SizedBox(height: 16)
                        ],
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }

  Widget Audio(){
    return Container(
      width: 400,
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
              child: Icon(Icons.fast_rewind),
              onPressed: () => controller.fastRewind()),
          CupertinoButton(
              child: PlayerBuilder.isPlaying(
                  player: controller.asset,
                  builder: (context,isPlaying){
                    return Icon(isPlaying ? Icons.pause : Icons.play_arrow);
                  }),
              onPressed: () => controller.playAudio()),
          CupertinoButton(
              child: Icon(Icons.fast_forward),
              onPressed: () => controller.fastForward()),
          PlayerBuilder.currentPosition(
              player: controller.asset,
              builder: (context, duration) {
                return Text("${duration.toString().substring(0,7)}");
              }
          ),
          SizedBox(width: Get.width/20),
          CupertinoButton(
              child: Icon(Icons.rotate_left_outlined),
              onPressed: () => controller.deceleration()),
          Obx(() => Text("${controller.playSpeed.value}x")),
          CupertinoButton(
              child: Icon(Icons.rotate_right),
              onPressed: () => controller.speedUp()),
        ],
      ),
    );
  }
}
