import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoignController>(
      () => LoignController(),
    );
  }
}
