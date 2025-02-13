import 'package:dio/src/headers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../app/data/colors.dart';
import '../app/routes/app_pages.dart';
import '../config/api_config.dart';
import '../config/local_storage.dart';

class Utils{
  static datePicker(BuildContext context, {Function(DateTime date)? onPick}) async {

    DateTime? selectedDate = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: AppColors.white, // <-- SEE HERE
              onSurface: AppColors.blueDarkColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.blueDarkColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      keyboardType: TextInputType.datetime,
      context: context, // You need to have access to the context
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && onPick!=null) {
      onPick(selectedDate);
    }
  }
  /// Global access to `LocalStorage` instance.
  static final LocalStorage localStorage = LocalStorage();

  /// API configuration based on the current token.
  static ApiConfig get api => ApiConfig(token: "");

  /// Logs in the user and navigates to the home screen.
  static Future<void> loginUser({
    required String token,
    required String email,
    String userProfileName = '',
    bool login = true,
    bool remember = false,
    required String userRole,
  }) async {
    localStorage
      ..userNameValue = userProfileName
      ..isLoginValue = login
      ..isRememberValue = remember
      ..userEmailValue = email
      ..userRoleValue = userRole;

    // Navigate to the HOME route
    await Get.toNamed(Routes.HOME);

  }

  /// Logs out the user and navigates to the login screen.
  static Future<void> logoutUser() async {
    localStorage
      ..userNameValue = ''
      ..isLoginValue = false
      ..isRememberValue = false
      ..userEmailValue = '';

    // Navigate to the LOGIN route
    await Get.offAllNamed(Routes.LOGIN);
  }

  static void manageCookies(Headers headers) {
    String? setCookies = headers['set-cookie']?.join('; ');
    if (setCookies != null) {
      localStorage.cookieValue = setCookies;

      // Use a regular expression to find the `user_id`
      RegExp userIdRegex = RegExp(r'user_id=([^;]+)');
      Match? match = userIdRegex.firstMatch(setCookies);

      if (match != null) {
        localStorage.userIdValue = match.group(1)??""; // Extract the value
      }
    }
  }

  static String formatDate(String inputFormat, String dateStr, String outputFormat) {
    try {
      DateFormat inputFormatter = DateFormat(inputFormat);
      DateFormat outputFormatter = DateFormat(outputFormat);

      DateTime dateTime = inputFormatter.parse(dateStr);
      return outputFormatter.format(dateTime);
    } catch (e) {
      return dateStr; // Return original if parsing fails
    }
  }

  static String getCurrentOrPreviousDate({int previous = 0, String outputFormat = "yyyy-MM-dd"}) {
    DateTime now = DateTime.now();
    DateTime adjustedDate;

    if (previous > 0) {
      // Get the first date of the adjusted month
      adjustedDate = DateTime(now.year, now.month, 1);
    } else {
      // Default to today's date
      adjustedDate = now;
    }

    DateFormat outFormat = DateFormat(outputFormat);
    return outFormat.format(adjustedDate);
  }

  static String getDayFromDate(String dateStr, {String format = "dd MMM yyyy"}) {
    try {
      DateFormat inputFormat = DateFormat(format);
      DateTime dateTime = inputFormat.parse(dateStr);

      DateFormat dayFormat = DateFormat('EEE'); // 'EEEE' gives full weekday name
      return dayFormat.format(dateTime);
    } catch (e) {
      print("Error parsing date: $e");
      return "Invalid Date";
    }
  }

  static String formatTimeTo12Hour(String timeStr, {String format = "HH:mm"}) {
    try {
      DateFormat inputFormat = DateFormat(format);
      DateFormat outputFormat = DateFormat("hh:mm a"); // 12-hour format with AM/PM

      DateTime dateTime = inputFormat.parse(timeStr);
      return outputFormat.format(dateTime);
    } catch (e) {
      return "---";
    }
  }

}