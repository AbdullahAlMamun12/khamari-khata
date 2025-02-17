import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../data/colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/main_bg_container.dart';
import '../controllers/login_controller.dart';

class LoignView extends GetView<LoignController> {
  const LoignView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  MainBgContainer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
              Container(
                margin: EdgeInsets.only(top: Get.height * .1),
                height: Get.height * .379,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                        child: Hero(
                          tag: "hen-logo",
                          child: Image.asset("assets/images/hen_logo.png",
                              height: Get.height * .3),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: "khamarr-logo",
                        child: Image.asset(
                            height: Get.height * .19, "assets/images/khamari_logo.png"),
                      )),
          
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Hero(
                        tag: "slog",
                        child: SvgPicture.asset(
                          "assets/icons/slog.svg",
                          height: Get.height * .018,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height:44),
              AppTextField(
                hintText: "মোবাইল নাম্বার",
              ),
              SizedBox(height:20),
              AppTextField(
                hintText: "পাসওয়ার্ড",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("পাসওয়ার্ড মনে নেই?"),
                  // need underline text
                  TextButton(child: Text("এখানে ক্লিক করুন!"), onPressed: (){},),
                ],
              ),
              SizedBox(
                width: 220,
                  height: 50,
                  child: AppButton(text: "লগ ইন", onPressed: (){},)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("একাউন্ট নেই?"),
                  // need underline text
                  TextButton(child: Text("এখানে ক্লিক করুন!"), onPressed: (){},),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("আপনি কি আমন্ত্রিত অতিথি?"),
                  // need underline text
                  TextButton(child: Text("তাহলে এখানে ক্লিক করুন!"), onPressed: (){},),
                ],
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
