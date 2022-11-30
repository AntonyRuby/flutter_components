import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_date_picker.dart/flutter_date_picker.dart';

class FlutterDatePicker {
  static final DateTime now = DateTime.now();
  Future<void> selectDate({required BuildContext context}) async {
    await flutterShowDatePicker(
      context: context,
      initialDate: now,
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      helpText: 'Select Date',
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );
  }
}

//         return Theme(
//           data: Theme.of(context).copyWith(
//               dialogBackgroundColor: Colors.white,
//               colorScheme: ColorScheme.light(
//                   primary: Colors.black, // header background color
//                   onPrimary: Colors.white, // header text color
//                   onSurface: Colors.black,
//                   secondary: Colors.purple

//                   // body text color
//                   ),
//               highlightColor: Colors.red,
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                     alignment: Alignment.center,
//                     primary: Colors.black,
//                     shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             color: Colors.black,
//                             width: 1,
//                             style: BorderStyle.solid),
//                         borderRadius: BorderRadius.circular(10))),
//               )),
//           child: child!,
//         );
//       },
//     );
//   }
// }
