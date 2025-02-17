import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../data/colors.dart';

class MainBgContainer extends StatelessWidget {
  final double bottomMargin;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const MainBgContainer({super.key, this.padding, this.child, this.bottomMargin = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // linear gradient
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFDFDFD),
                Color(0xFFEBF2FB),
                Color(0xFFAFC8E4)],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset("assets/icons/bg_circle.svg", width: Get.width * .3,),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
