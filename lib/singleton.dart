import 'package:flutter/services.dart';
import 'package:m2p_flutter_base/m2p_flutter_base.dart';

class Singleton {
  MethodChannel methodChannelName =
      const MethodChannel('icici.flutter.methodChannel');

  //TO common API triggering value with OTP submition
  Map<String, dynamic> requestValues = {};
  APIRequestType apiRequestType = APIRequestType.post;
  String urlString = '';

  //TO common API triggering for OTP
  Map<String, dynamic>? otpRequestValues;
  APIRequestType? otpAPIRequestType;
  String? otpUrlString;

  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static Singleton get instance => _singleton;
}
