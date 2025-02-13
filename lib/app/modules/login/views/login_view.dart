import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoignView extends GetView<LoignController> {
  const LoignView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoignView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoignView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
