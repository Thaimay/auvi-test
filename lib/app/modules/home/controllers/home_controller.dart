import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final pathFileVideo = "".obs;
  final pathFileAudio = "".obs;
  final RxBool play = false.obs;

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

  void chooseFileAudio()async{
    final result = await pickerFile(this.pathFileAudio.value,FileType.audio);
    if(result == null) return;
    this.pathFileAudio.value = result.toString();
    print("abc....${this.pathFileAudio}");
  }
}
