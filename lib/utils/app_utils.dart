import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showErrorToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showToast(String text,
      {ToastGravity gravity = ToastGravity.CENTER,
      Color backgroundColor = Colors.grey}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showSnackBar(BuildContext context, String value,
      {Color? backgroundColor}) {
    final SnackBar sandbar = SnackBar(
      duration: const Duration(milliseconds: 1000),
      width: MediaQuery.of(context).size.width,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.white),
      ),
      backgroundColor: backgroundColor ?? Colors.green,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(sandbar);
  }

  static void showErrorSnackBar(BuildContext context, String value,
      {int durations = 2000}) {
    final SnackBar snackbar = SnackBar(
      duration: Duration(milliseconds: durations),
      width: 710,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }
    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }
    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String getFirstName(String fullName) {
    var names = fullName.split(' ');
    return names[0];
  }

  static String getLastName(String fullName) {
    var names = fullName.split(' ');
    String lastName = '';

    if (names.length > 1) {
      lastName = names[1];
    }
    return lastName;
  }
}
