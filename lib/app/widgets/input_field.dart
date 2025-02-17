import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/colors.dart';
import '../data/style.dart';

class AppTextField extends TextFormField {
// Custom constructor that accepts all parameters you need
  AppTextField({
    super.key,
    super.controller,
    InputDecoration? decoration,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    TextStyle? style,
    super.onChanged,
    super.validator,
    bool autoValidate = false,
    bool super.enabled = true,
    super.autofocus,
    super.obscureText,
    super.autocorrect,
    MaxLengthEnforcement? maxLengthEnforced ,
    super.maxLines = null,
    super.minLines,
    super.maxLength,
    super.onSaved,
    super.onEditingComplete,
    super.focusNode,
    super.expands,
    int? minFontSize,
    int? maxFontSize,
    int? maxLengthForAutoValidation,
    super.toolbarOptions,
    super.inputFormatters,
    bool? enabledInteractiveSelection,
    super.onTap,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    Color super.cursorColor = Colors.black,
    super.keyboardAppearance,
    super.scrollPadding,
    super.scrollPhysics,
    super.autofillHints,
    super.restorationId,
    String? hintText,
  }) : super(
          decoration:decoration?? InputDecoration(
            fillColor: AppColors.white,filled: true,contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary,width: 1.5),
              borderRadius: BorderRadius.circular(15),
          ),
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary,width: 1.5),
              borderRadius: BorderRadius.circular(15),
          ),
            hintText: hintText
          ),
          style: style??Style.text12W300,
          maxLengthEnforcement: maxLengthEnforced,
        );
}
