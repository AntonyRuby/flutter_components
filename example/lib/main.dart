import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_components/flutter_widget.dart';
import 'package:flutter_components/models/flutter_actionsheet_models.dart';
import 'package:flutter_components/models/flutter_bottom_navbar_models.dart';
import 'package:flutter_components/models/flutter_tabbar_models.dart';
import 'package:flutter_components/widget/flutter_action_sheet.dart';
import 'package:flutter_components/widget/flutter_bottom_navigation.dart';
import 'package:flutter_components/widget/flutter_button.dart';
import 'package:flutter_components/widget/flutter_chip.dart';
import 'package:flutter_components/dropdown_utils/flutter_dropdown.dart';
import 'package:flutter_components/dropdown_utils/dropdown_model.dart';
import 'package:flutter_components/widget/flutter_alert_dialog.dart';
import 'package:flutter_components/widget/flutter_input_fields/flutter_input_fields_widget.dart';
import 'package:flutter_components/widget/flutter_appbar.dart';
import 'package:flutter_components/widget/flutter_core_widgets.dart';
import 'package:flutter_components/widget/flutter_otp_widget/otp.dart';
import 'package:flutter_components/widget/flutter_otp_widget/pin_code.dart';
import 'package:flutter_components/widget/flutter_scafold_widget.dart';
import 'package:flutter_components/widget/flutter_search_field.dart';
import 'package:flutter_components/widget/flutter_segment_view.dart';
import 'package:flutter_components/widget/flutter_slider.dart/flutter_slider.dart';
import 'package:flutter_components/widget/flutter_stepper.dart';
import 'package:flutter_components/widget/flutter_switch.dart';
import 'package:flutter_components/widget/flutter_radio.dart';
import 'package:flutter_components/widget/flutter_tabbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends CoreWidgets {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends CoreWidgetsState<MyHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController jobRoleSearchDropdownCtrl = TextEditingController();
  TextEditingController jobSearchDropdownCtrl = TextEditingController();
  FocusNode jobRoleFormFocusNode = FocusNode();
  List<DropdownModel> dropdownData = [];
  late TabController controller;
  List<FlutterTabbarModels> flutterTabbarModels = [];
  List<FlutterActionSheetModels> flutterActionSheetModels = [];

  BorderColorEnum borderColor = BorderColorEnum.Default;
  String? statusTextVal;
  int count = 0;
  bool switchValue = false;
  bool checkBoxValue = false;
  bool radioValue = false;
  int currentIndex = 0;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<FlutterTabbarModels> tabBarModels = [];
  List<NavigationbarModels> navigationBarModels = [];
  String? selectedValue;
  bool isLoading = true;
  int yourLocalVariable = 0;
  List myData = [];
  Future<String>? value;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    getLocalJsonData();
    loadDropdownData();
    value = getJsons();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  final TextEditingController enterPin = TextEditingController();
  bool isOTPSuccess = true;
  String currentText = "";
  int otpLength = 4;
  late DateTime dateTime;
  final DateTime now = DateTime.now();
  String? mySelection;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme().getThemeData(context),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      home: FlutterWidgetState(
        child: FlutterScaffold(
          isAppBar: true,
          resizeToAvoidBottomInset: false,
          toolBarIconEnum: IconEnum.close,
          toolBarShowSearch: true,
          toolbarIsSearchBoarder: false,
          toolBarActionMenuIconEnum: MenuIconEnum.notification,
          toolBarCaptionText: 'Caption',
          toolBarTitleString: 'Name',
          toolBarElevation: 0.25,
          toolBarNotificationCount: 22,
          toolBarCallback: (value) {
            if (value is String) {

            } else if (value is ButtonClickAction) {
              if (value == ButtonClickAction.mainMenu) {}
            }
          },
          searchHint: 'Search Hint',
          floatingIcon: Icons.abc,
          bottomNavigationBar: FlutterBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            selectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            // ignore: prefer_const_literals_to_create_immutables
            items: navigationBarModels
                .map(
                  (element) => BottomNavigationBarItem(
                    label: element.title,
                    icon: Icon(
                      element.icons,
                    ),
                    activeIcon: Icon(
                      element.icons,
                      color: ColorResource.colorD02127,
                    ),
                  ),
                )
                .toList(),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Stepper',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                FlutterStepper(
                  height: 26,
                  width: 95,
                  maxValue: 8,
                  minValue: 1,
                  onChanged: (value) {
                    yourLocalVariable = value;
                  },
                  stepperStyle: StepperStyleEnum.custom,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                const SizedBox(
                  height: 10,
                ),
                FlutterSlider(
                  divisions: 10,
                  iconView: true,
                  min: 0,
                  max: 100,
                  onChangeEnd: ((value) {
                    print(value);
                  }),
                ),
                FlutterOtp(
                  onChanged: (String value) {},
                  validator: (v) {
                    if (v?.length == otpLength) {
                      if (v != "1111") {
                        return 'Password Not Match';
                      } else {
                        return null;
                      }
                    }
                    return null;
                  },
                  isOTPSuccess: isOTPSuccess,
                  onCompleted: (String value) {
                    setState(() {
                      isOTPSuccess = value == '1111' ? true : false;
                    });
                  },
                  controller: enterPin,
                  obscuringCharacter: '*',
                  length: otpLength,
                  shape: PinCodeFieldShape.box,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: FlutterSearchField(
                      isMic: true,
                      controller: searchController,
                      isPrefix: true,
                      callback: (value) {},
                      onClose: (val) {
                        searchController.clear();
                      },
                      isCancelButton: true,
                      searchHint: 'Search Text'),
                ),
                const SizedBox(
                  height: 20,
                ),
                FlutterSegment(
                  tabs: const [
                    'Yesterday',
                    'Today',
                    'Tomorrow',
                    'day after tomorrow',
                    'Sunday',
                    'Monday',
                  ],
                  isScrollable: true,
                  selected: (index, selectedIndex) {},
                  radius: 8,
                  normalBackgroundColor: ColorResource.colorF0F2F5,
                  activeBackgroundColor: Colors.green,
                  borderColor: Colors.black,
                  activeTitleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Toggle',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                FlutterSwitch(
                  value: switchValue,
                  toggleSize: 21,
                  onTap: (val) {
                    setState(() {
                      switchValue = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Radio',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GroupRadioButton(
                    label: [const Text("A"), const Text("B")],
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    spaceBetween: 5,
                    radioRadius: 10,
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    onChanged: (listIndex) {
                      print(listIndex);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Job Roles Search Dropdown'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlutterDropdown.search(
                    // hintText: 'Select value',
                    lableText: 'Label',
                    focusNode: jobRoleFormFocusNode,
                    dropdownList: List<String>.generate(
                        myData.length, (i) => myData[i]['title'].toString()),
                    excludeSelected: false,
                    controller: jobSearchDropdownCtrl,
                    isDisabled: false,
                    isEditable: false,
                    isShowStatus: true,
                    textAlignVertical: TextAlignVertical.center,
                    statusText: statusTextVal,
                    borderSide: BorderSideEnum.fill,
                    borderColorEnum: borderColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    multiSelect: false,
                    displayUpLayout: false,
                    onChanged: (value) {
                      setState(() {
                        mySelection = value;
                      });
                    },
                    validation: (value) {
                      if (value?.isEmpty ?? false) {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                FlutterTabBar(
                  tabs: flutterTabbarModels.map((e) => e.title!).toList(),
                  prefixIcon:
                      flutterTabbarModels.map((e) => e.prefixIcon).toList(),
                  suffixIcon:
                      flutterTabbarModels.map((e) => e.suffixIcon).toList(),
                  isScrollable: true,
                  isDisable:
                      flutterTabbarModels.map((e) => e.isEnable).toList(),
                  tabMargin: const EdgeInsets.symmetric(horizontal: 16.0),
                  lableColor: Theme.of(context).tabBarTheme.labelColor,
                  indicatorWeight: 2.0,
                  onTap: (index) {
                    debugPrint('--->> $index');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FlutterChip(
                  label: 'Chips',
                  deleteIcon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  avatar: const CircleAvatar(
                    child: Icon(
                      Icons.abc,
                    ),
                  ),
                  labelPadding: const EdgeInsets.all(8),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
                FlutterInputFields(
                  'Enter Name',
                  textEditingController,
                  validationRules: const ['required'],
                  focusNode: focusNode,
                ),
                FlutterAlertDialog(
                  title: 'Verification',
                  description: 'Your Information in the audit, please wait!',
                  image: 'assets/png/alert_dialog_image.png',
                ),
                FlutterButton(
                  buttonText: 'A',
                  isEnabled: true,
                  width: 130,
                  buttonSize: ButtonSize.large,
                ),
                FlutterActionSheet(
                  title: 'Title ',
                  message: 'Subtitle',
                  actionWidget: flutterActionSheetModels
                      .map((e) => e.titleText!)
                      .toList(),
                  icon: flutterActionSheetModels.map((e) => e.icon!).toList(),
                  cancelButton: 'Cancel',
                  iconType: IconType.textWithIcon,
                ),
              ],
            ),
          ),
        ),
        isLoading: isLoading,
      ),
    );
  }

  void loadDropdownData() {
    dropdownData.addAll([]);
    flutterTabbarModels.addAll([
      FlutterTabbarModels(
        title: 'Label 1',
        suffixIcon: Icons.arrow_back,
      ),
      FlutterTabbarModels(
        title: 'Label 2',
        prefixIcon: Icons.card_giftcard,
        suffixIcon: Icons.info,
      ),
      FlutterTabbarModels(
        title: 'Label 3',
        prefixIcon: Icons.person,
      ),
      FlutterTabbarModels(
        title: 'Label 4',
        prefixIcon: Icons.tab_outlined,
      ),
    ]);

    navigationBarModels.addAll([
      NavigationbarModels(
        title: 'Card',
        icons: Icons.payment,
      ),
      NavigationbarModels(
        title: 'Repayment',
        icons: Icons.attach_money,
      ),
      NavigationbarModels(
        title: 'Camera',
        icons: Icons.local_see_outlined,
      ),
      NavigationbarModels(
        title: 'Scheduled',
        icons: Icons.calendar_today_outlined,
      ),
      NavigationbarModels(
        title: 'Profile',
        icons: Icons.person_outline,
      ),
    ]);

    flutterActionSheetModels.addAll([
      FlutterActionSheetModels(
        titleText: 'Settings',
        icon: Icons.settings,
      ),
      FlutterActionSheetModels(
        titleText: 'Refresh',
        icon: Icons.refresh,
      ),
      FlutterActionSheetModels(
        titleText: 'Delete',
        icon: Icons.delete,
      )
    ]);
  }

  // drop down listvalues
  Future<String> getJsons() async {
    await Future.delayed(
      const Duration(seconds: 10),
    );
    return getJson();
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/list.json');
  }

  getLocalJsonData() async {
    var val = await getJson();
    setState(() {
      myData = json.decode(val);
    });
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
