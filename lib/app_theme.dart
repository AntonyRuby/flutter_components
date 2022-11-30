import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/font.dart';

class AppTheme {
  Color? primarySuccessEnabledLight;

  late bool isDarkMode;

  AppTheme({this.primarySuccessEnabledLight}) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
  }

  ThemeData getThemeData(BuildContext context) {
    if (isDarkMode) {
      // dark mode
      return darkThemeData(context: context);
    } else {
      // light mode
      return lightThemeData(context: context);
    }
  }

  static ThemeData darkThemeData({required BuildContext context}) {
    return ThemeData.dark().copyWith(
      typography: Typography.material2014(),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        caption: TextStyle(
            color: ColorResource.color151515,
            // backgroundColor: ColorResource.colorFFFFFF,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 13,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),

        button: TextStyle(
            color: ColorResource.colorFFFFFF,
            backgroundColor: ColorResource.color151515,
            fontFamily: Font.ilisarniqRegular.value,
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: ColorResource.colorFFFFFF,
            backgroundColor: ColorResource.color151515,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: ColorResource.color151515,
            // backgroundColor: ColorResource.colorFFFFFF,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
          color: ColorResource.colorFFFFFF,
          backgroundColor: ColorResource.color151515,
          fontFamily: Font.ilisarniqLight.value,
          fontSize: 22,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorResource.color151515,
            fontFamily: Font.ilisarniqMedium.value,
            fontWeight: FontWeight.w500,
            fontSize: 17),
        iconTheme: IconThemeData(color: ColorResource.colorD02127, size: 18),
        backgroundColor: ColorResource.colorFFFFFF,
        actionsIconTheme:
            IconThemeData(color: ColorResource.colorD02127, size: 27),
      ),
      buttonTheme: ButtonThemeData(buttonColor: ColorResource.colorE5E5E5),
      iconTheme: IconThemeData(size: 32, color: ColorResource.colorD02127),
      // backgroundColor: ColorResource.colorFFFFFF,
      backgroundColor: ColorResource.color282829,

      dividerTheme: DividerThemeData(color: Colors.black12),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return ColorResource.colorFFFFFF;
            return ColorResource.color151515;
            // Use the component's default.
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return TextStyle(color: ColorResource.colorE2E5EB);
            return TextStyle(
                color:
                    ColorResource.color151515); // Use the component's default.
          },
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.resolveWith<Color>(
          //   (Set<MaterialState> states) {
          //     if (states.contains(MaterialState.disabled))
          //       return ColorResource.color151515;
          //     return ColorResource.colorE5E5E5; // Use the component's default.
          //   },
          // ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return TextStyle(color: ColorResource.colorAFAEAF);
              return TextStyle(
                  color: ColorResource
                      .color151515); // Use the component's default.
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return BorderSide(color: ColorResource.colorAFAEAF);
              else
                return BorderSide(color: ColorResource.color151515);
            },
          ),
        ),
      ),
      dialogBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(
          primary: Colors.red,
          // header background color
          onPrimary: Colors.white,
          // header text color
          onSurface: Colors.white,
          surface: Colors.black),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            alignment: Alignment.center,
            // primary: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.white, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10))),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorResource.colorFFFFFF,
        unselectedItemColor: ColorResource.color808080,
        unselectedIconTheme: IconThemeData(color: ColorResource.color808080),
        selectedIconTheme: IconThemeData(color: ColorResource.colorD02127),
        selectedLabelStyle: TextStyle(
            fontSize: 10, height: 1.7, color: ColorResource.colorFFFFFF),
        unselectedLabelStyle: TextStyle(
            fontSize: 10, height: 1.7, color: ColorResource.color808080),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: ColorResource.color151515,
        unselectedLabelColor: ColorResource.color151515,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.red,
          fontSize: 14,
        ),
        indicator: BoxDecoration(
          // color: ColorResource.colorF0F2F5,
          border: Border(
            bottom: BorderSide(width: 2.0, color: ColorResource.colorD02127),
          ),
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: ColorResource.color151515,
          fontSize: 14,
        ),
      ),
      // checkboxTheme: CheckboxThemeData(
      //   side: BorderSide(color: ColorResource.color404040, width: 1.0),
      //   fillColor: MaterialStateProperty.resolveWith((states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return ColorResource.color333333;
      //     }
      //     return ColorResource.colorFFFFFF;
      //   }),
      //   // checkColor: MaterialStateProperty.all(ColorResource.color151515),
      //   checkColor: MaterialStateProperty.resolveWith((states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return ColorResource.color151515;
      //     } else if (states.contains(MaterialState.disabled)) {
      //       return ColorResource.color4D4E50;
      //     }
      //     return ColorResource.color151515;
      //   }),
      // ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.colorFFFFFF;
          }
          if (states.contains(MaterialState.focused)) {
            return ColorResource.color808080;
          }
          if (states.contains(MaterialState.disabled)) {
            return ColorResource.color333333;
          }
          return ColorResource.colorFFFFFF;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.colorFFFFFF;
          }
          if (states.contains(MaterialState.disabled)) {
            return ColorResource.color808080;
          }
          return ColorResource.colorFFFFFF;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.color32A64D;
          }
          if (states.contains(MaterialState.focused)) {
            return ColorResource.color404040;
          }
          if (states.contains(MaterialState.disabled)) {
            return ColorResource.color333333;
          }
          return ColorResource.color32A64D;
        }),
      ),
    );
  }

  static ThemeData lightThemeData({required BuildContext context}) {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color(0xFFF7F7F7),
      typography: Typography.material2014(),
      textTheme: TextTheme(
        // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        caption: TextStyle(
            color: ColorResource.color151515,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 13,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),

        button: TextStyle(
            color: ColorResource.colorFFFFFF,
            backgroundColor: ColorResource.color151515,
            fontFamily: Font.ilisarniqRegular.value,
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: ColorResource.color151515,
            backgroundColor: ColorResource.colorFFFFFF,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 15,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: ColorResource.color151515,
            backgroundColor: ColorResource.colorFFFFFF,
            fontFamily: Font.ilisarniqLight.value,
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
          color: ColorResource.color151515,
          backgroundColor: ColorResource.colorFFFFFF,
          fontFamily: Font.ilisarniqLight.value,
          fontSize: 22,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: ColorResource.color151515,
            fontFamily: Font.ilisarniqMedium.value,
            fontWeight: FontWeight.w500,
            fontSize: 17),
        iconTheme: IconThemeData(color: ColorResource.colorD02127, size: 18),
        backgroundColor: ColorResource.colorFFFFFF,
        actionsIconTheme:
            IconThemeData(color: ColorResource.colorD02127, size: 27),
      ),
      buttonTheme: ButtonThemeData(buttonColor: ColorResource.colorE5E5E5),
      iconTheme: IconThemeData(size: 32, color: ColorResource.colorD02127),
      // backgroundColor: ColorResource.colorFFFFFF,
      backgroundColor: ColorResource.colorF0F2F5,
      dividerTheme: DividerThemeData(color: Colors.black12),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return ColorResource.colorAFAEAF;
            return ColorResource.color151515; // Use the component's default.
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled))
              return TextStyle(color: ColorResource.colorE2E5EB);
            return TextStyle(
                color:
                    ColorResource.color151515); // Use the component's default.
          },
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.resolveWith<Color>(
          //   (Set<MaterialState> states) {
          //     if (states.contains(MaterialState.disabled))
          //       return ColorResource.color151515;
          //     return ColorResource.colorE5E5E5; // Use the component's default.
          //   },
          // ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return TextStyle(color: ColorResource.colorAFAEAF);
              return TextStyle(
                  color: ColorResource
                      .color151515); // Use the component's default.
            },
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return BorderSide(color: ColorResource.colorAFAEAF);
              else
                return BorderSide(color: ColorResource.color151515);
            },
          ),
        ),
      ),
      dialogBackgroundColor: Colors.white,

      colorScheme: ColorScheme.light(
        primary: Colors.black, // header background color
        onPrimary: Colors.white, // header text color
        onSurface: Colors.black,
      ),

      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              alignment: Alignment.center,
              // primary: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)))),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorResource.color151515,
        unselectedItemColor: ColorResource.color898A8B,
        unselectedIconTheme: IconThemeData(color: ColorResource.color898A8B),
        selectedIconTheme: IconThemeData(color: ColorResource.colorD02127),
        selectedLabelStyle: TextStyle(fontSize: 10, height: 1.7),
        unselectedLabelStyle: TextStyle(fontSize: 10, height: 1.7),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: ColorResource.color151515,
        unselectedLabelColor: ColorResource.color151515,
        indicator: BoxDecoration(
          color: ColorResource.color4D4E50,
          border: Border(
            bottom: BorderSide(width: 2.0, color: ColorResource.colorD02127),
          ),
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: ColorResource.color151515,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.red,
          fontSize: 14,
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.color151515;
          }
          if (states.contains(MaterialState.focused)) {
            return ColorResource.colorD2D2D3;
          }
          if (states.contains(MaterialState.disabled)) {
            return ColorResource.colorE2E5EB;
          }
          return ColorResource.color151515;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.colorFFFFFF;
          }
          if (states.contains(MaterialState.focused)) {
            return ColorResource.colorFFFFFF;
          }
          return ColorResource.colorFFFFFF;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorResource.color32A64D;
          }
          if (states.contains(MaterialState.focused)) {
            return ColorResource.colorD2D2D3;
          }
          if (states.contains(MaterialState.disabled)) {
            return ColorResource.colorF7F7F7;
          }
          return ColorResource.color32A64D;
        }),
      ),
    );
  }
}
