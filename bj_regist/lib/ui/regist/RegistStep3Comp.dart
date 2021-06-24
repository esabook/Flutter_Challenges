import 'dart:io';
import 'dart:math';

import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:bj_regist/constant/StringCons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'RegistUIViewModel.dart';

class RegistStep3Comp extends StatefulWidget {
  const RegistStep3Comp({Key? key}) : super(key: key);

  @override
  _RegistStep3CompState createState() => _RegistStep3CompState();
}

class _RegistStep3CompState extends State<RegistStep3Comp>
    with TickerProviderStateMixin {
  RegistUIViewModel model = RegistUIViewModel.instance!;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void pleaseGotoNextPage() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                SimpleDialogOption(
                  child: Text("Exit from app"),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    exit(0);
                  },
                )
              ],
              content: Column(
                children: [
                  Text("${StringCons.email}: ${model.email}"),
                  Text(
                      "${StringCons.goalForActivation}: ${model.goalActivation}"),
                  Text("${StringCons.monthlyIncome}: ${model.monthlyIncome}"),
                  Text("${StringCons.monthlyExpense}: ${model.monthlyExpense}"),
                  Text(
                      "Scheduled video call: ${model.scheduledDateTime.toString()}"),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(DimeCons.dimen_20, DimeCons.dimen_10,
          DimeCons.dimen_20, DimeCons.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          CircleAvatar(
            backgroundColor: ColorCons.buttonEnabled,
            maxRadius: 36,
            child: SizedBox(
              width: DimeCons.dimen_72,
              height: DimeCons.dimen_72,
              child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) => Container(
                      child: Icon(Icons.circle_notifications,
                          color: Colors.white,
                          size: min(
                              DimeCons.dimen_72,
                              max(
                                  DimeCons.dimen_56,
                                  DimeCons.dimen_72 *
                                      animationController!.value))))),
            ),
          ),
          Container(
            height: DimeCons.dimen_32,
          ),
          Text(
            "Schedule Video Call",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: DimeCons.dimen_22),
          ),
          Text(
            "Choose the date and time that you preferred, we will send a link via email to make video call on the scheduled date and time",
            style: TextStyle(color: Colors.white, fontSize: DimeCons.dimen_20),
          ),
          Container(
            height: DimeCons.dimen_48,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                DimeCons.dimen_10, DimeCons.dimen_10, DimeCons.dimen_4, 0),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                color: ColorCons.lowEmphasis),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: model.scheduledDateTime == null
                      ? null
                      : DateFormat("EEEE, dd MMM yyyy")
                          .format(model.scheduledDateTime!)),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: model.scheduledDateTime ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)));
                setState(() {
                  model.scheduledDateTime = date!;
                });
              },
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    iconSize: DimeCons.dimen_20,
                    onPressed: null,
                    icon: RotatedBox(
                        quarterTurns: -45,
                        child: Icon(Icons.arrow_back_ios_rounded))),
                labelText: "Date",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "- Choose Date -",
                hintStyle: TextStyle(color: Colors.black87),
                contentPadding: EdgeInsets.fromLTRB(DimeCons.dimen_10,
                    DimeCons.dimen_16, DimeCons.dimen_10, DimeCons.dimen_4),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: ColorCons.lowEmphasis,
              ),
            ),
          ),
          Container(
            height: DimeCons.dimen_32,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                DimeCons.dimen_10, DimeCons.dimen_10, DimeCons.dimen_4, 0),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                color: ColorCons.lowEmphasis),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: model.scheduledDateTime == null
                      ? null
                      : DateFormat("hh:mm").format(model.scheduledDateTime!)),
              onTap: () async {
                var time = await showTimePicker(
                  context: context,
                  initialTime: model.scheduledDateTime == null
                      ? TimeOfDay.now()
                      : TimeOfDay.fromDateTime(model.scheduledDateTime!),
                );
                setState(() {
                  if (model.scheduledDateTime == null)
                    model.scheduledDateTime = DateTime.now();
                  model.scheduledDateTime = model.scheduledDateTime
                      ?.add(Duration(hours: time!.hour, minutes: time.minute));
                });
              },
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    iconSize: DimeCons.dimen_20,
                    onPressed: null,
                    icon: RotatedBox(
                        quarterTurns: -45,
                        child: Icon(Icons.arrow_back_ios_rounded))),
                labelText: "Time",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "- Choose Time -",
                hintStyle: TextStyle(color: Colors.black87),
                contentPadding: EdgeInsets.fromLTRB(DimeCons.dimen_10,
                    DimeCons.dimen_16, DimeCons.dimen_10, DimeCons.dimen_4),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: ColorCons.lowEmphasis,
              ),
            ),
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
                onPressed: model.scheduledDateTime != null &&
                        model.scheduledDateTime!.millisecondsSinceEpoch >
                            DateTime.now().millisecondsSinceEpoch
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
