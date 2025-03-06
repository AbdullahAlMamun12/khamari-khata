import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khamarikhata/app/modules/forgot_pass/views/password_change_view.dart';

import '../views/verify_phone_for_forgot_view.dart';

class ForgotPassController extends GetxController {
  //TODO: Implement ForgotPassController

  final count = 0.obs;

  TextEditingController phoneController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  String? validatePhone(String? value) {
    if(value == null || value.isEmpty) {
      return 'ফোন নম্বর টাইপ করুন';
    }
    else if(value.length < 11) {
      return 'ফোন নম্বর কমপক্ষে ১১ অক্ষর থাকতে হবে';
    }
    // phone number must start with 01
    else if(value.substring(0, 2) != '01') {
      return 'আপনার ফোন নম্বরটি শুরুতে ০১ দিতে হবে';
    }
    return null;
  }

  void onSendOptButtonPressed() => Get.to(()=>VerifyPhoneForgotPassView());
  void onVerifyPhoneButtonPressed() => Get.to(()=>PasswordChangeView());

  void onCancelButtonPressed() => Get.back();
}
