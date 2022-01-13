import 'package:get/get.dart';

import 'package:auvi/app/modules/audio/bindings/audio_binding.dart';
import 'package:auvi/app/modules/audio/views/audio_view.dart';
import 'package:auvi/app/modules/home/bindings/home_binding.dart';
import 'package:auvi/app/modules/home/views/home_view.dart';
import 'package:auvi/app/modules/audio/bindings/run_audio_binding.dart';
import 'package:auvi/app/modules/audio/views/run_audio_view.dart';
import 'package:auvi/app/modules/video/bindings/run_video_binding.dart';
import 'package:auvi/app/modules/video/bindings/video_binding.dart';
import 'package:auvi/app/modules/video/views/run_video_view.dart';
import 'package:auvi/app/modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.AUDIO,
      page: () => AudioView(),
      binding: AudioBinding(),
    ),
    GetPage(
      name: _Paths.RUN_VIDEO,
      page: () => RunVideoView(),
      binding: RunVideoBinding(),
    ),
    GetPage(
      name: _Paths.RUN_AUDIO,
      page: () => RunAudioView(),
      binding: RunAudioBinding(),
    ),
  ];
}
