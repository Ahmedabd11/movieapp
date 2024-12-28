
import 'package:flutter/services.dart';

import '../params/app_ui/app_ui_params.dart';

class AppConstants{
  final Size appDesignSize = const Size(375, 812);
  final String liveBearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNDEzZTZjODgyYWY1NDYwY2RlMzZmNTE0ODAxNThiMiIsIm5iZiI6MTczNTI3OTg0Ni4zMjMsInN1YiI6IjY3NmU0NGU2MWVmYzI0MzRjZjEyYTJjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.724_6bfzLsW8GPIRM6eJxnLNGG2-r6EFVgho056IFD8";
  final String liveApiKey="a413e6c882af5460cde36f51480158b2";

  // LOCALIZATIONS
  final defaultLocalizationsScreenName = 'default';
  final defaultLanguageDirection = 'ltr';
  // final defaultTwoStepAuthMethod=injector<AppUIParams>().localization.localized('methodMessageHeading', screenName:'/two_step_auth_choice_screen');

  final defaultTwoStepAuthMethod='Text Message (SMS)';

  final defaultLanguageKey = 'en';
  final localizationBoxName = 'localizationCacheBox';
  final localizationObjectKey = 'localizationObjectKey';
  final defaultLanguageStub = {
    "label": "English",
    "value": "en",
    "direction": "ltr"
  };
  // PHONE NUMBER PREFIX
  final phonePrefixLtr = "+249";
  final phonePrefixRtl = "249+";
  final phoneNumberHint = "Mobile Number";
  final searchHint = "Search";
  final double graphBegin=0.1;
  final double graphMid=0.34;
  final double graphEnd=0.0;
  final genderHint = "Gender";
  final passwordHint = "Password";
  final pinHint = "Pin Code";
  final pinConfirmHint = "Confirm Pin Code";
  final firstName = "First Name";
  final lastName = "Last Name";
  final emailAddress = "Email Address";
  final personalAddress = "Personal Address";
  final widgetSearchHint = "Search";
  final dateofBirth = "Date Of Birth";
  final String USER_LIST_URL='https://jsonplaceholder.typicode.com/users';
  final String debugLogKey = "Clean Architecture App :::";
}
