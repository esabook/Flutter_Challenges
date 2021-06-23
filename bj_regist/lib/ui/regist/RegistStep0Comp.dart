import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:bj_regist/constant/StringCons.dart';
import 'package:bj_regist/ui/regist/RegistUIViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bj_regist/util/StringUtils.dart';

class RegistStep0Comp extends StatefulWidget {
  const RegistStep0Comp({Key? key}) : super(key: key);

  @override
  _RegistStep0CompState createState() => _RegistStep0CompState();
}

class _RegistStep0CompState extends State<RegistStep0Comp> {
  RegistUIViewModel model = RegistUIViewModel.instance!;

  void pleaseGotoNextPage() {
    model.gotoNextFlowStep();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCons.lowEmphasis,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 140,
            child: Container(
              color: ColorCons.accent,
              child: SvgPicture.asset(
                "graphics/bg_notch.svg",
                color: ColorCons.lowEmphasis,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -6, 0),
            padding:
                EdgeInsets.fromLTRB(DimeCons.dimen_20, 0, DimeCons.dimen_20, 0),
            width: double.infinity,
            color: ColorCons.lowEmphasis,
            child: RichText(
                text: TextSpan(
                    text: "Welcome to\nGIN ",
                    style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: DimeCons.dimen_56,
                        fontWeight: FontWeight.w700),
                    children: [
                  TextSpan(
                      text: "Finans",
                      style: TextStyle(color: ColorCons.accent)),
                ])),
          ),
          Container(
            transform: Matrix4.translationValues(0, -6, 0),
            padding: EdgeInsets.fromLTRB(
                DimeCons.dimen_20, DimeCons.dimen_24, DimeCons.dimen_20, 0),
            width: double.infinity,
            child: Text(
              "Welcome to the bank of the future. Manage and track your accounts on the go.\n",
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: DimeCons.dimen_24, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -6, 0),
            padding: EdgeInsets.all(DimeCons.dimen_20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(DimeCons.dimen_16),
                child: TextFormField(
                  initialValue: model.email,
                  onChanged: (it) => setState(() => model.email = it),
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(DimeCons.dimen_10)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: ColorCons.mediumEmphasis,
                      size: DimeCons.dimen_24,
                    ),
                    fillColor: ColorCons.lowEmphasis,
                    hintStyle: TextStyle(
                      color: ColorCons.mediumEmphasis,
                    ),
                    hintText: StringCons.email,
                  ),
                ),
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
                  onPressed: model.email?.isValidEmail() == true ? pleaseGotoNextPage : null,
                  child: Text(
                    StringCons.next,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: DimeCons.dimen_24),
                  ),
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                        backgroundColor: buttonStateColor,
                      )),
            ),
          ),
        ],
      ),
    );
  }

  MaterialStateColor buttonStateColor =
      MaterialStateColor.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? ColorCons.buttonDisabled
        : ColorCons.buttonEnabled;
  });
}
