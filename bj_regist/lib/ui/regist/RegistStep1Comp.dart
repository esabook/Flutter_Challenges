import 'package:bj_regist/constant/ColorCons.dart';
import 'package:bj_regist/constant/DimenCons.dart';
import 'package:bj_regist/constant/StringCons.dart';
import 'package:bj_regist/ui/regist/RegistUIViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistStep1Comp extends StatefulWidget {
  const RegistStep1Comp({Key? key}) : super(key: key);

  @override
  _RegistStep1CompState createState() => _RegistStep1CompState();
}

class _RegistStep1CompState extends State<RegistStep1Comp> {
  RegistUIViewModel model = RegistUIViewModel.instance!;
  bool togglePasswordEnabled = true;

  void pleaseGotoNextPage() {
    model.gotoNextFlowStep();
  }

  @override
  Widget build(BuildContext context) {
    var invalidPasswordTypes = model.getPasswordInvalidType();
    int weak = invalidPasswordTypes.length;
    String passwordStrength = model.tempPassword.isEmpty
        ? ""
        : weak == 0
            ? "Very Strong"
            : weak == 1
                ? "Strong"
                : weak == 2
                    ? "Weak"
                    : "Very Weak";

    return Padding(
      padding: EdgeInsets.all(DimeCons.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          Text(
            "Create Password",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: DimeCons.dimen_22),
          ),
          Text(
            "Password will be used to login to account",
            style: TextStyle(color: Colors.white, fontSize: DimeCons.dimen_20),
          ),
          Divider(
            height: DimeCons.dimen_48,
            color: ColorCons.accent,
          ),
          TextField(
            onChanged: (it) => setState(() => model.tempPassword = it),
            showCursor: true,
            obscureText: togglePasswordEnabled,
            style: TextStyle(fontWeight: FontWeight.bold),
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
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility_rounded),
                onPressed: () {
                  setState(() {
                    togglePasswordEnabled = !togglePasswordEnabled;
                  });
                },
                color: ColorCons.mediumEmphasis,
                iconSize: DimeCons.dimen_24,
              ),
              fillColor: ColorCons.lowEmphasis,
              hintStyle: TextStyle(
                color: ColorCons.mediumEmphasis,
              ),
              hintText: StringCons.createPassword,
            ),
          ),
          Divider(
            height: DimeCons.dimen_32,
            color: ColorCons.accent,
          ),
          RichText(
              text: TextSpan(
                  text: "Complexity:  ",
                  style: DefaultTextStyle.of(context).style.copyWith(
                      color: Colors.white, fontSize: DimeCons.dimen_20),
                  children: [
                TextSpan(
                    text: passwordStrength,
                    style: TextStyle(
                        color: ColorCons.highlight,
                        fontWeight: FontWeight.bold)),
              ])),
          Divider(
            height: DimeCons.dimen_48,
            color: ColorCons.accent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PasswordValidatorUI(
                  headerText: "a",
                  label: "Lowercase",
                  isValidMode: !invalidPasswordTypes
                      .contains(PasswordInvalidType.LOWERCASE)),
              PasswordValidatorUI(
                  headerText: "A",
                  label: "Uppercase",
                  isValidMode: !invalidPasswordTypes
                      .contains(PasswordInvalidType.UPPERCASE)),
              PasswordValidatorUI(
                  headerText: "123",
                  label: "Number",
                  isValidMode: !invalidPasswordTypes
                      .contains(PasswordInvalidType.NUMBER)),
              PasswordValidatorUI(
                  headerText: "9+",
                  label: "Characters",
                  isValidMode: !invalidPasswordTypes
                      .contains(PasswordInvalidType.CHARACTERS)),
            ],
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
                onPressed:
                    invalidPasswordTypes.isEmpty ? pleaseGotoNextPage : null,
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

const TextStyle validIndicatorHeader = TextStyle(
  color: Colors.white,
  fontSize: DimeCons.dimen_32,
);
const TextStyle validIndicatorLabel = TextStyle(
  color: Colors.white,
  fontSize: DimeCons.dimen_16,
);

class PasswordValidatorUI extends StatelessWidget {
  String headerText;
  String label;
  bool isValidMode;

  late Widget headerWidget = Text(headerText, style: validIndicatorHeader);
  late Widget validIconWidget = Icon(
    Icons.check_circle_sharp,
    color: ColorCons.greenValid,
    size: DimeCons.dimen_32,
  );
  late Widget labelWidget = Text(
    label,
    style: validIndicatorLabel,
  );

  PasswordValidatorUI(
      {Key? key,
      required this.headerText,
      required this.label,
      required this.isValidMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: this.isValidMode ? validIconWidget : headerWidget,
        ),
        labelWidget
      ],
    );
  }
}
