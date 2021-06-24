import 'dart:collection';

import 'package:bj_regist/ui/regist/RegistStep0Comp.dart';
import 'package:bj_regist/ui/regist/RegistStep1Comp.dart';
import 'package:bj_regist/ui/regist/RegistStep2Comp.dart';
import 'package:bj_regist/ui/regist/RegistStep3Comp.dart';
import 'package:flutter/cupertino.dart';


class RegistUIViewModel with ChangeNotifier {
  static RegistUIViewModel? _instance;
  int _currentFlowStep = 0;

  String? email;
  String tempPassword = "";
  String? goalActivation;
  String? monthlyIncome;
  String? monthlyExpense;
  DateTime? scheduledDateTime;

  var goalActivationItems = ["Goal_1", "Goal_2", "Goal_3"];
  var monthlyIncomeItems = ["< Rp 5 juta,-", "5 juta Sampai 10 juta", "> 10 juta"];
  var monthlyExpenseItems = ["< Rp 1 juta,-", "1 juta Sampai 5 juta", "5 juta Sampai 10 juta", "> 10 juta"];

  /// FIXME: simulate persistData with singleTone
  static RegistUIViewModel? get instance {
    if (_instance == null) {
      _instance = RegistUIViewModel();
    }
    return _instance;
  }


  /// max page or step
  int get maxFlowStep => registFlow.length;

  /// current page flow
  int get currentFlowStep => _currentFlowStep;

  void gotoNextFlowStep() {
    _currentFlowStep++;
    notifyListeners();
  }

  void gotoPreviousFlowStep() {
    _currentFlowStep--;
    notifyListeners();
  }

  /// return all known error of invalidType
  List<PasswordInvalidType> getPasswordInvalidType() {
    List<PasswordInvalidType> invalidType = List.empty(growable: true);
    if (!tempPassword.contains(RegExp("[a-z]")))
      invalidType.add(PasswordInvalidType.LOWERCASE);
    if (!tempPassword.contains(RegExp("[A-Z]")))
      invalidType.add(PasswordInvalidType.UPPERCASE);
    if (!tempPassword.contains(RegExp("[0-9]")))
      invalidType.add(PasswordInvalidType.NUMBER);
    if (!tempPassword
        .contains(RegExp("[!@#%^&*()_+={};':|,.<>?/\\-\\\\\"?\$\\[\\]]")))
      invalidType.add(PasswordInvalidType.CHARACTERS);
    return invalidType;
  }

  /// known page flow for userJourney
  var registFlow = [(ctx) => RegistStep0Comp(), (ctx) => RegistStep1Comp(), (ctx) => RegistStep2Comp(),(ctx) => RegistStep3Comp()];
}

/// password input has valid if not marked with this type
enum PasswordInvalidType { LOWERCASE, UPPERCASE, NUMBER, CHARACTERS }
