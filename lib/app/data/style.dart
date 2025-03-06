import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

class Style{
  static TextStyle get text26W500 => GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500, color: AppColors.primary);
  static TextStyle get textBn14W500 => TextStyle(fontFamily: 'Shadhinat', fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black);
  static TextStyle get textBn15W500 => TextStyle(fontFamily: 'Shadhinat', fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.black);
  static TextStyle get textBn16W500 => TextStyle(fontFamily: 'Shadhinat', fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black);
  static TextStyle get textBn17W500 => TextStyle(fontFamily: 'Shadhinat', fontSize: 17, fontWeight: FontWeight.w500, color: AppColors.primary100);
  static TextStyle get textBn18W400 => TextStyle(fontFamily: 'Shadhinat', fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black);
  static TextStyle get textBn18W600 => TextStyle(fontFamily: 'Shadhinat', fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black);
  static TextStyle get textBn20W600 => TextStyle(fontFamily: 'Shadhinat', fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black);
  static TextStyle get textBn22W800 => TextStyle(fontFamily: 'Shadhinat', fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.black);
  static TextStyle get textBn24W700 => TextStyle(fontFamily: 'Shadhinat', fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black);
}


