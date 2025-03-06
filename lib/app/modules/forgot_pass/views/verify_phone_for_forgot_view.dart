import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:khamarikhata/app/widgets/main_bg_container.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/colors.dart';
import '../../../data/style.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../controllers/forgot_pass_controller.dart';

class VerifyPhoneForgotPassView extends GetView<ForgotPassController> {
  const VerifyPhoneForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        body: MainBgContainer(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("পাসওয়ার্ড রিসেট", style: Style.textBn18W400,),
                        SizedBox(width: 10),
                        Image.asset('assets/images/Info.png',height: 20,width: 20),
                      ],
                    ),
                    SizedBox(height:20),
                    Image.asset(
                      "assets/images/otp.png",
                      height: Get.width*.75,
                      width: Get.width*.75,
                    ),

                    SizedBox(height:35),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        inactiveColor:AppColors.primary100,
                        activeColor: Colors.white,
                        activeFillColor: AppColors.primary100,
                        inactiveFillColor: AppColors.white
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      // controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {

                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      }, appContext: context,
                    ),

                    Text("আপনার মোবাইলে ৬ সংখ্যার একটি কোড পাঠানো হয়েছে| সেটি উপরে লিখুন", style: Style.textBn15W500),
                    SizedBox(height:30),
                    SizedBox(
                        width: 220,
                        height: 50,
                        child: AppButton(text: "এগিয়ে যান", textStyle: Style.textBn16W500.copyWith(color: Colors.white), onPressed: controller.onVerifyPhoneButtonPressed)),


                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("প্রয়োজন নেই?"),
                        // need underline text
                        TextButton(child: Text("বাতিল করুন!", style: Style.textBn16W500.copyWith(color: AppColors.primary),), onPressed: controller.onCancelButtonPressed,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
