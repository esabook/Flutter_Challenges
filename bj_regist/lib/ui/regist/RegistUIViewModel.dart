import 'dart:collection';

import 'package:bj_regist/ui/regist/RegistStep0Comp.dart';
import 'package:bj_regist/ui/regist/RegistStep1Comp.dart';
import 'package:flutter/cupertino.dart';

class RegistUIViewModel with ChangeNotifier {
  static RegistUIViewModel? _instance;

  static RegistUIViewModel? get instance {
    if (_instance == null) {
      _instance = RegistUIViewModel();
    }
    return _instance;
  }

  String? email;
  String tempPassword = "";
  String? goalActivation;
  double? monthlyIncome;
  double? monthlyExpense;


  List<PasswordInvalidType> getPasswordInvalidType() {
    List<PasswordInvalidType> invalidType = List.empty(growable: true);
    if (!tempPassword.contains(RegExp("[a-z]")))
      invalidType.add(PasswordInvalidType.LOWERCASE);
    if (!tempPassword.contains(RegExp("[A-Z]")))
      invalidType.add(PasswordInvalidType.UPPERCASE);
    if (!tempPassword.contains(RegExp("[0-9]")))
      invalidType.add(PasswordInvalidType.NUMBER);
    if (!tempPassword.contains(RegExp("[!@#%^&*()_+={};':|,.<>?/\\-\\\\\"?\$\\[\\]]")))
      invalidType.add(PasswordInvalidType.CHARACTERS);
    return invalidType;
  }

  HashMap<String, WidgetBuilder> registFlow = HashMap.of({
    "/email": (ctx) => RegistStep0Comp(),
    "/password": (ctx) => RegistStep1Comp(),
    "/personaInfo": (ctx) => RegistStep1Comp(),
    "/videoCall": (ctx) => RegistStep1Comp(),
  });

  int _currentFlowStep = 1;

  int get currentFlowStep => _currentFlowStep;

  void gotoNextFlowStep() {
    _currentFlowStep++;
    notifyListeners();
  }

  void gotoPreviousFlowStep() {
    _currentFlowStep--;
    notifyListeners();
  }

  int get maxFlowStep => registFlow.length;
}

enum PasswordInvalidType { LOWERCASE, UPPERCASE, NUMBER, CHARACTERS }
