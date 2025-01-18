import 'dart:async';

import 'package:get/get.dart';

import '../views/home_view/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        HomeView(),
      ),
    );
  }
}
