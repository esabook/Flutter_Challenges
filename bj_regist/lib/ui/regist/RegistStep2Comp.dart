import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:bj_regist/constant/StringCons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegistUIViewModel.dart';

class RegistStep2Comp extends StatefulWidget {
  const RegistStep2Comp({Key? key}) : super(key: key);

  @override
  _RegistStep2CompState createState() => _RegistStep2CompState();
}

class _RegistStep2CompState extends State<RegistStep2Comp> {
  RegistUIViewModel model = RegistUIViewModel.instance!;

  void pleaseGotoNextPage() {
    model.gotoNextFlowStep();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DimeCons.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: DimeCons.dimen_22),
          ),
          Text(
            "Please fill in the information bellow and your goal for digital saving.",
            style: TextStyle(color: Colors.white, fontSize: DimeCons.dimen_20),
          ),
          Container(
            height: DimeCons.dimen_48,
          ),
          DropDownUI(
            items: model.goalActivationItems,
            label: StringCons.goalForActivation,
            hint: StringCons.chooseOption,
            initialValue: model.goalActivation,
            onChange: (it) =>
                setState(() => model.goalActivation = it as String?),
          ),
          Container(
            height: DimeCons.dimen_32,
          ),
          DropDownUI(
            items: model.monthlyIncomeItems,
            label: StringCons.monthlyIncome,
            hint: StringCons.chooseOption,
            initialValue: model.monthlyIncome,
            onChange: (it) =>
                setState(() => model.monthlyIncome = it as String?),
          ),
          Container(
            height: DimeCons.dimen_32,
          ),
          DropDownUI(
            items: model.monthlyExpenseItems,
            label: StringCons.monthlyExpense,
            hint: StringCons.chooseOption,
            initialValue: model.monthlyExpense,
            onChange: (it) =>
                setState(() => model.monthlyExpense = it as String?),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(DimeCons.dimen_20),
            child: SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: model.monthlyIncome != null &&
                        model.goalActivation != null &&
                        model.monthlyExpense != null
                    ? pleaseGotoNextPage
                    : null,
                child: Text(
                  StringCons.next,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: DimeCons.dimen_24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownUI extends StatelessWidget {
  var items = [];
  String? label;
  String? hint;
  String? initialValue;
  ValueChanged<Object?>? onChange = (str) => {};

  DropDownUI(
      {Key? key, required this.items, this.label, this.hint,this.initialValue, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          DimeCons.dimen_10, DimeCons.dimen_10, DimeCons.dimen_4, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
          color: ColorCons.lowEmphasis),
      child: DropdownButtonFormField(
        value: initialValue,
        items: items
            .map((e) => DropdownMenuItem(
                  child: Text(e, style: TextStyle(color: Colors.black87),),
                  value: e,
                ))
            .toList(),
        onChanged: (it) => onChange?.call(it),
        style: TextStyle(fontWeight: FontWeight.bold),
        icon: IconButton(
            iconSize: DimeCons.dimen_20,
            onPressed: null,
            icon: RotatedBox(
                quarterTurns: -45, child: Icon(Icons.arrow_back_ios_rounded))),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black87),
          contentPadding: EdgeInsets.fromLTRB(DimeCons.dimen_10,
              DimeCons.dimen_16, DimeCons.dimen_10, DimeCons.dimen_4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ColorCons.lowEmphasis,
        ),
      ),
    );
  }
}
