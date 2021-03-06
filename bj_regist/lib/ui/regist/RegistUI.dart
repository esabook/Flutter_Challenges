
import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:bj_regist/ui/regist/RegistUIViewModel.dart';
import 'package:bj_regist/widget/CircleTextStep.dart';
import 'package:flutter/material.dart';

class RegistUI extends StatefulWidget {
  const RegistUI({Key? key}) : super(key: key);

  @override
  _RegistUIState createState() => _RegistUIState();
}

class _RegistUIState extends State<RegistUI> {
  String _title = "Create Account";
  RegistUIViewModel model = RegistUIViewModel.instance!;

  @override
  void initState() {
    super.initState();
    model.addListener(pleaseReload);
  }

  void pleaseReload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (model.currentFlowStep != 0) {
          model.gotoPreviousFlowStep();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCons.accent,
          elevation: 0,
          centerTitle: false,
          toolbarTextStyle: TextStyle(fontWeight: FontWeight.bold),
          automaticallyImplyLeading: false,
          leading: model.currentFlowStep == 0
              ? null
              : IconButton(
                  onPressed: () => model.gotoPreviousFlowStep(),
                  icon: const Icon(Icons.arrow_back_rounded)),
          title: Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorCons.accent,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(DimeCons.dimen_16),
                child: CircleTextStep(
                  currentProgressStep: model.currentFlowStep,
                  maxProgressStep: model.maxFlowStep,
                ),
              ),
              Expanded(
                  child: model.registFlow
                      .elementAt(model.currentFlowStep)
                      .call(context))
            ],
          ),
        ),
      ),
    );
  }
}
