import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khamarikhata/utils/utils.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {


  final formKey = GlobalKey<FormState>();
  final RxBool obscureText = true.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



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

  void togglePassword() => obscureText.value = !obscureText.value;

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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'পাসওয়ার্ড টাইপ করুন';
    }
    else if (value.length < 6) {
      return 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষর থাকতে হবে';
    }
    return null;
  }

  Future<void> onLoginButtonPressed() async {
    if(formKey.currentState!.validate()) {
      var response = await Utils.api.open.post("/auth/login",params: {
        "phonenumber":phoneController.text,
        "password":passwordController.text,
      });
      if(response['status'] == 'OK') {
        Get.offAllNamed(Routes.HOME);
      }else{
        // message will be you phone number or password is wrong
        Get.snackbar("সমস্যা হয়েছে", response['message'] );
      }
    }
  }

  void onSignUpButtonPressed()=>Get.toNamed(Routes.SIGNUP);

  void forgotPasswordButtonPressed() => Get.toNamed(Routes.FORGOT_PASS);
}
