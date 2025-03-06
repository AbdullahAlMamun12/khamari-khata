import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:khamarikhata/app/widgets/main_bg_container.dart';

import '../../../data/colors.dart';
import '../../../data/style.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../controllers/forgot_pass_controller.dart';

class PasswordChangeView extends GetView<ForgotPassController> {
  const PasswordChangeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBgContainer(
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
                    Image.asset('assets/images/otp_fill.png',height: 20,width: 20),
                  ],
                ),
                Spacer(),
                Image.asset(
                  "assets/images/security.png",
                  height: Get.width*.75,
                  width: Get.width*.75,
                ),
                // AppTextField(
                //   controller: controller.phoneController,
                //   keyboardType: TextInputType.phone,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly,
                //     LengthLimitingTextInputFormatter(11),
                //   ],
                //   decoration: AppTextField.inputStyle.copyWith(
                //     hintText: "আপনার মোবাইল নাম্বারটি লিখুন",
                //     suffixIcon: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 15),
                //       child: Image.asset("assets/images/phone_se.png", height: 20,),
                //     ),
                //   ),
                //   validator: controller.validatePhone,
                // ),
                SizedBox(height:35),

                SizedBox(
                    width: 220,
                    height: 50,
                    child: AppButton(text: "এগিয়ে যান", textStyle: Style.textBn17W500.copyWith(color: Colors.white), onPressed: controller.onVerifyPhoneButtonPressed,)),


                Spacer(),
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
    );
  }
}
