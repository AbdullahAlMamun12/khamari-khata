import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:khamarikhata/app/widgets/main_bg_container.dart';

import '../../../data/colors.dart';
import '../../../data/style.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBgContainer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: Get.height * 0.27,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary,
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(

                      bottom: Get.height * 0.07,
                      right: 0,
                      left: 0,
                      child: Hero(
                        tag: "hen-logo",
                        child: Image.asset("assets/images/hen_logo.png",
                            height: Get.height * .15),
                      )),
                  Positioned(
                    bottom: Get.height * 0.020,
                      left: 0,
                      right: 0,
                      child: Hero(
                        tag: "khamarr-logo",
                        child: Image.asset(
                            height: Get.height * .1, "assets/images/khamari_logo.png"),
                      )),

                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: "slog",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("মালিকের তথ্য", style: Style.textBn22W800,),
                          SizedBox(width: 10),
                          Image.asset('assets/images/Info.png',height: 20,width: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AppTextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      decoration: AppTextField.inputStyle.copyWith(
                        hintText: "আপনার (মালিকের) নাম লিখুন",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset("assets/icons/profile_fill.svg", height: 20, colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: .3), BlendMode.srcATop),),
                        ),
                      ),
                      validator: controller.validatePhone,
                    ),
                    SizedBox(height:20),
                    AppTextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      decoration: AppTextField.inputStyle.copyWith(
                        hintText: "মোবাইল নাম্বার",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset("assets/images/phone_se.png", height: 20,),
                        ),
                      ),
                      validator: controller.validatePhone,
                    ),

                    Spacer(),
                    SizedBox(
                        width: 220,
                        height: 50,
                        child: AppButton(text: "মোবাইল নাম্বার যাচাই করুন", textStyle: Style.textBn17W500.copyWith(color: Colors.white), onPressed: controller.onVerifyPhoneButtonPressed,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("একাউন্ট আছে?"),
                        // need underline text
                        TextButton(child: Text("এখানে ক্লিক করুন!", style: Style.textBn16W500.copyWith(color: AppColors.primary),), onPressed: controller.onExistingUserButtonPressed,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
