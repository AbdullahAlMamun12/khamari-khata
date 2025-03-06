import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/colors.dart';
import '../data/style.dart';

class AppTextField extends TextFormField {

  static InputDecoration inputStyle = InputDecoration(
      fillColor: AppColors.white,
      filled: true,
      hintStyle: Style.textBn16W500,
      suffixIconConstraints: BoxConstraints(
          minHeight: 24,
          minWidth: 24
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary200, width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ));

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
          decoration:decoration ?? inputStyle.copyWith(hintText: hintText),
          style: style??Style.textBn17W500,
          maxLengthEnforcement: maxLengthEnforced,
        );
}
