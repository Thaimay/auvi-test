import 'package:auvi_test/app/modules/home/controllers/home_controller.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerView extends StatelessWidget {
  HomeController controller = Get.find();

  VideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPlayerView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetX<HomeController>(builder: (_){
            if(_.index.value == 0){
              return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayerPlaylist(
                      betterPlayerConfiguration: const BetterPlayerConfiguration(autoPlay: true),
                      betterPlayerPlaylistConfiguration: const BetterPlayerPlaylistConfiguration(loopVideos: true),
                      betterPlayerDataSourceList:  _.dataSourceList)
              );
            }
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _.betterPlayerController,
              ),
            );
          }),
          const SizedBox(height: 30),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.image.length,
                  itemBuilder: (context,index){
                    if(index == 0){
                      return Container();
                    }
                    return InkWell(
                      onTap: () => controller.playVideo(index),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.network(controller.image[index]),
                              Container(
                                padding: const EdgeInsets.only(top: 10,left: 15),
                                width: double.infinity,
                                height: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.black38
                                ),
                                child: Text("Video 0${index}",style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                ),),
                              )
                            ],
                          ),
                          const SizedBox(height: 16)
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
}
