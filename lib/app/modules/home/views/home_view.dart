import 'package:auvi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  onPressed: () => Get.toNamed(Routes.VIDEO),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text("Video")),
              MaterialButton(
                onPressed: () => Get.toNamed(Routes.AUDIO),
                color: Colors.blue,
                textColor: Colors.white,
                child: const Text("Audio"),
              ),
            ],
          ),
        ));
  }
}
