import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.count.value;

    return Scaffold(
      body: Image.asset("assets/images/splash_bg.jpg",height: size.height+20,width: size.width,fit: BoxFit.fitHeight,),
    );
  }
}
