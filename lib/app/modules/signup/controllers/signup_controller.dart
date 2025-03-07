import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

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
      // please enter a valid phone number in the format 01XXXXXXXXX in bangla text
      return 'আপনার ফোন নম্বরটি শুরুতে ০১ দিতে হবে';
    }
    return null;
  }

  void onVerifyPhoneButtonPressed() {

  }

  void onExistingUserButtonPressed() => Get.back();
}
