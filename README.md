//Flutter dropdown

         FlutterDropdown(
                        hintText: 'Select value',
                        lableText: 'Lable',
                        focusNode: jobRoleFormFocusNode,
                        dropdownList: dropdownData,
                        excludeSelected: false,
                        controller: jobRoleSearchDropdownCtrl,
                        isDisabled: false,
                        isEditable: false,
                        isShowStatus: true,
                        statusText: statusTextVal,
                        borderSide: BorderSideEnum.fill,
                        borderColorEnum: BorderColorEnum.Default,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        multiSelect: false,
                        onChanged: (value) {
                         //TODO --> will callback when user select the dropdown value
                        },
                        validation: (value) {
                          if (value?.isEmpty ?? false) {
                            return null;
                          }
                        },
                      ),


// Flutter BottomNavigationBar
        int _currentIndex = 0;

         FlutterBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          items: [
            BottomNavigationBarItem(
              label: 'Card',
              icon: Icon(Icons.payment),
              activeIcon: Icon(
                Icons.payment,
                color: ColorResource.colorD02127,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Repayment',
              icon: Icon(Icons.attach_money),
              activeIcon: Icon(
                Icons.attach_money,
                color: ColorResource.colorD02127,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Camera',
              icon: Icon(Icons.local_see_outlined),
              activeIcon: Icon(
                Icons.local_see_outlined,
                color: ColorResource.colorD02127,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Scheduled',
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(
                Icons.calendar_today_outlined,
                color: ColorResource.colorD02127,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(
                Icons.person_outline,
                color: ColorResource.colorD02127,
              ),
            ),
          ],
        ),

// Flutter Chip

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

// Flutter Inputfield
     
         FlutterInputFields(
                  'Enter Name',
                  textEditingController,
                  validationRules: const ['required'],
                  focusNode: focusNode,
         ),

// Flutter Stepper

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

// Flutter Slider
   
           FlutterSlider(
                  divisions: 10,
                  iconView: true,
                  min: 0,
                  max: 100,
                  onChangeEnd: ((value) {
                    print(value);
                  }),
           ),

// Flutter Otp

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

// Flutter SearchField

            FlutterSearchField(
                      isMic: true,
                      controller: searchController,
                      isPrefix: true,
                      callback: (value) {},
                      onClose: (val) {
                        searchController.clear();
                      },
                      isCancelButton: true,
                      searchHint: 'Search Text'
            ),

// Flutter Segment

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

// Flutter Switch

            FlutterSwitch(
                  value: switchValue,
                  toggleSize: 21,
                  onTap: (val) {
                    setState(() {
                      switchValue = val;
                    });
                  },
            ),

// Flutter RadioButton
     
            GroupRadioButton(
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

// Flutter DropDownWith Search

            FlutterDropdown.search(
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

// Flutter TabBar

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

// Flutter Chip

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

// Flutter InpuField

            FlutterInputFields(
                  'Enter Name',
                  textEditingController,
                  validationRules: const ['required'],
                  focusNode: focusNode,
                ),

// Flutter Alert Dialog

                FlutterAlertDialog(
                  title: 'Verification',
                  description: 'Your Information in the audit, please wait!',
                  image: 'assets/png/alert_dialog_image.png',
                ),

// Flutter Button
                
                FlutterButton(
                  buttonText: 'A',
                  isEnabled: true,
                  width: 130,
                  buttonSize: ButtonSize.large,
                ),

// Flutter ActionSheet

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

      
