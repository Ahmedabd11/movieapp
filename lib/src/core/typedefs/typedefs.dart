


// =================== GENERIC RESPONSE HANDLING CALLBACKS ====================
import 'package:flutter/cupertino.dart';

typedef ApiCallBack<T> = T Function();
// =================== API CLIENT CALLBACKS ===================
//typedef ResponseCallBack = Function(ResponseWrapper);
typedef ErrorCallBack = Function(dynamic);
//typedef ApiCacheCallBack<T> = Function(ResponseWrapper?, bool canProceed);

// ================== API RESPONSE TYPES =====================
//typedef ApiResponseType = ApiResponse Function();

// =================== LIFE CYCLE CALLBACKS ====================
typedef ValueUpdater<T> = T Function();

// =================== ERROR DIALOG CALLBACKS ==================
//typedef DialogOkButtonCallBack = VoidCallback;
//typedef DialogRetryButtonCallBack = VoidCallback;
typedef DialogCloseCallBack = Function(dynamic);

// =================== LOCALIZATIONS CALLBACKS =================
//typedef OnLocalizationUpdated = Function(Language?);


typedef FieldValidator = String? Function(String? data);

// =================== DROP DOWN CALLBACKS ===================
typedef OnDropDownItemChanged<T> = Function(T);
//typedef MapDropDownText<T> = Widget Function(T);

// =================== CONSUMER CALLBACKS ===================
typedef ConsumerBuilderCallBack<T> = Widget Function(BuildContext, T, Widget?);
typedef ConsumerBuilderCallBack2<T, K> = Widget Function(
   BuildContext, T, K, Widget?);
typedef ConsumerReadyCallBack<T> = Function(T);
typedef ConsumerReadyCallBack2<T, K> = Function(T, K);

// =================== BOTTOM NAV CALLBACKS =================
typedef BottomNavOnPressedCallBack = void Function(int);

// =================== SINGLE STRING CALLBACKS =================
typedef SingleStringCallBack = void Function(String);

// =================== BASE WIDGET CALLBACKS ==================
typedef OnWillPopCallBack = Future<bool> Function();
typedef OnBackPressed = bool Function();

// =================== TEXT FIELD VALIDATOR CALLBACKS ==================
typedef OnTextFieldErrorCallBack = Function(String?);
typedef TextFormFieldValidityFlag = Function(bool);
typedef MapDropDownText<T> = Widget Function(T);
//typedef TextFormFieldMapErrorUsingConditions = TextFieldValidatorModel Function(
  //  String);

// =================== TOGGLE BUTTON CALLBACKS ==================
typedef OnToggleButtonChanged = Function(int)?;




// =================== MANAGE NUMBER CALLBACK CALLBACK ===============
typedef ManageNumberCallBack = Function();

// =================== MANAGE NUMBER CALLBACK CALLBACK ===============
typedef SelectNumberCallback = Function();

// =================== MANAGE NUMBER CALLBACK CALLBACK ===============
typedef DeleteNumberCallback = Function(String);

// =================== SWITCH NUMBER DIALOG CALLBACKS ================

// =================== REMOVE CUSTOM OFFER WIDGET CALLBACK ================
typedef RemoveCustomOfferCallBack = Function();

// =================== INSTANTIATE GENERICS ======================
typedef InstanceCreator<T> = T Function();

// =================== UPDATE NUMBER CALLBACK ======================
typedef UpdateNumberCallBack = Function();

// =================== APP UTIL ====================
