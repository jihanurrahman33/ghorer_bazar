import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Image.network(
            height: 300,
            width: 300,
            'https://ghorerbazar.com/cdn/shop/files/logo.webp?v=1707766182'),
      ),
    );
  }
}
