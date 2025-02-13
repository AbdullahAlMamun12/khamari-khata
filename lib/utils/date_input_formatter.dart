import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateTextFormatter extends TextInputFormatter {
  final String separator;

  DateTextFormatter({this.separator = '/'});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // This fixes the backspace bug
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    final dateText = _addSeparators(newValue.text, separator);
    final adjustedDateText = _adjustDayOfMonth(dateText);

    return newValue.copyWith(
      text: adjustedDateText,
      selection: updateCursorPosition(adjustedDateText),
    );
  }

  String _addSeparators(String value, String separator) {
    value = value.replaceAll(separator, ''); // Remove existing separators
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1 || i == 3) {
        newString += separator;
      }
    }
    return newString;
  }

  String _adjustDayOfMonth(String dateText) {
    // Split the date text into day, month, and year parts
    final dateParts = dateText.split(separator);
    if (dateParts.length != 3) {
      return dateText; // Invalid format, return as is
    }

    int day = int.tryParse(dateParts[0]) ?? 0;
    int month = int.tryParse(dateParts[1]) ?? 0;
    int year = int.tryParse(dateParts[2]) ?? 0;


    // Calculate the maximum number of days for the selected month
    final maxDaysInMonth = DateTime(year, month + 1, 0).day;

    // Adjust the day to be within the valid range
    day = day.clamp(1, maxDaysInMonth);
    if(month>12)month=12;
    return '${day.toString().padLeft(2, '0')}$separator${month.toString().padLeft(2,'0')}$separator${dateParts[2]}';
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
