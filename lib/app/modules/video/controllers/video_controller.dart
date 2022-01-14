
import 'package:better_player/better_player.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  //TODO: Implement VideoController
  // final videoList = <VideoModel>[
  //   VideoModel(
  //       name: "Big Buck Bunny VOD",
  //       file:
  //           "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
  //       image:
  //           "https://www.blendernation.com/wp-content/uploads/2008/05/afbeelding-1.png",
  //       time: "9.56"),
  //   VideoModel(
  //       name: "Sintel VOD",
  //       file:
  //           "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8",
  //       image:
  //           "http://madartistpublishing.com/site_assets/blog/epic-adventure-cgi-3d-animated-short-film-sintel-animation-by-the-blender-foundation1-mad-artist-publishing-ltd.-madartistpublishing-Fantasy-Adventure-CGI-3d-Animated-Short-Film-SINTEL-Animation-by-the-Blender-Foundation.jpg",
  //       time: "14.48"),
  //   VideoModel(
  //       name: "For Bigger Blazes",
  //       file:
  //           "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  //       image:
  //           "https://d2z1w4aiblvrwu.cloudfront.net/ad/76Ab/google-chromecast-bigger-blazes-large-7.jpg",
  //       time: "0.15"),
  // ].obs;

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

  void increment() => count.value++;

  List<BetterPlayerDataSource> createDataSet() {
    final dataSourceList = <BetterPlayerDataSource>[];
    dataSourceList.add(
        BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
        ));
    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8",
    ));
    return dataSourceList;
  }
}
