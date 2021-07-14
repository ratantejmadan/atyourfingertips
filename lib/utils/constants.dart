import 'package:flutter/material.dart';

class MixedConstants {
  static const String WEBSITE_URL = 'https://atsign.com/';
  // for local server
  static const String ROOT_DOMAIN = 'root.atsign.org';
  static const String NAMESPACE = 'at_chat';
  static const String TERMS_CONDITIONS = 'https://atsign.com/terms-conditions/';
  static const String PRIVACY_POLICY = 'https://atsign.com/privacy-policy/';
}

class AppStrings {
  static String appNamespace = 'at_chat_demo';
  static String regex = '.$appNamespace@';
  static const String scan_qr = "Let's Go!";
  static const String reset_keychain = "Reset Keychain";
  static const String atsign_error = 'ATSIGN_NOT_FOUND';
}

String splitter = '@_@';
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  fillColor: Color(0XFFF1EBE5),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0XFFAF8B66), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0XFFAF8B66), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

