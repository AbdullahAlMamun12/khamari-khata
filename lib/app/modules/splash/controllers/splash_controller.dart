import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
    // Display the splash screen for 2 seconds
    Future.delayed(const Duration(milliseconds: 2000), () {

      if (Utils.localStorage.isLogin) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }

}
