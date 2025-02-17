import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/colors.dart';
import '../../../widgets/main_bg_container.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.count.value;

    return Scaffold(
        body: MainBgContainer(
          child: Stack(
                children: [
          Positioned(
              top: Get.height * .14,
              child: Hero(
                tag: "khamarr-logo",
                child: Image.asset(
                    height: Get.height * .19, "assets/images/khamari_logo.png"),
              )),
          Positioned(
              right: 5,
              bottom: Get.height * .235,
              child: Hero(
                tag: "hen-logo",
                child: Image.asset("assets/images/hen_logo.png",
                    height: Get.height * .4),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * .4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(Get.width * .47)),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: Get.height * .15,
              child: Hero(
                tag: "slog",
                child: SvgPicture.asset(
                  "assets/icons/slog.svg",
                  height: Get.height * .023,
                ),
              )),
                ],
              ),
        ));
  }
}
