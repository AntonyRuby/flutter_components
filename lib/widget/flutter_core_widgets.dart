import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/singleton.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_components/utils/app_utils.dart';
import 'dart:developer' as developer;

import 'package:m2p_flutter_base/m2p_flutter_base.dart';

/// Base class of the CoreWidget's stateful widget class
abstract class CoreWidgets extends StatefulWidget {
  /// base class constructor of CoreWidget's stateful widget class
  const CoreWidgets({Key? key}) : super(key: key);
}

/// Base class of the CoreWidget's state class
// class CoreWidgetsState extends State<CoreWidgets> {
class CoreWidgetsState<T> extends State<CoreWidgets> {
  //Sample or Example values
  bool updating = false;
  dynamic singletonInstance;
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
   // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    singletonInstance = Singleton.instance;
    initConnectivity();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  //To otp error shown Toast

  // Future otpErrorForCommon()async {
  //   bool otpValidate = false;
  //   await
  // }

  //TO common API for storing the data along with OTP
  Future<bool> otpVerifyForAllCommonRequest() async {
    bool isCanReturn = false;
    await APIRepository.apiRequest(
            Singleton.instance.apiRequestType, Singleton.instance.urlString,
            requestBodyData:
                Map<String, dynamic>.from(Singleton.instance.requestValues))
        .then((value) {
      if (value['success']) {
        isCanReturn = value['success'];
      } else {
        AppUtils.showToast(value['data']);
      }
    });
    return isCanReturn;
  }

  //TO common API triggering for OTP
  Future<bool> otpTriggerForAllCommonRequest() async {
    bool sendOtpResult = false;
    await APIRepository.apiRequest(Singleton.instance.otpAPIRequestType!,
            Singleton.instance.otpUrlString!,
            isToastEnable: false)
        .then((value) {
      if (value['success']) {
        sendOtpResult = true;
      } else {
        AppUtils.showToast(value['data']);
      }
    });
    return sendOtpResult;
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      // _connectionStatus = result;
    });
  }

  Future<void> _update() async {
    setState(() {
      updating = false;
    });
  }

  void update() {
    setState(() {
      updating = true;
    });
    _update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Get the settings panel content.
  Widget? buildSettings(BuildContext context) {
    return null;
  }

  void showInSnackBar({String value = 'Error'}) {
    debugPrint('Error message--> $value');
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
