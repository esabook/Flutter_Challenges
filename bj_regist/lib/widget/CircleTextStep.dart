import 'package:bj_regist/constant/DimenCons.dart';
import 'package:flutter/material.dart';

class CircleTextStep extends StatelessWidget {
  int? maxProgressStep = 0;
  int? currentProgressStep = 0;

  CircleTextStep({Key? key, this.maxProgressStep, this.currentProgressStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> circleLine = List.empty(growable: true);
    for (int i = 1; i <= maxProgressStep!; i++) {
      circleLine
          .add(generateCircleText(i.toString(), i <= currentProgressStep!));
    }
    return Stack(alignment: Alignment.center, children: [
      horizontalLineWidget,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: circleLine,
      ),
    ]);
  }

  Widget horizontalLineWidget = Center(
    child: Container(
      height: DimeCons.dimen_4,
      color: Colors.black,
    ),
  );

  Widget generateCircleText(String _text, bool _checked) => Container(
        width: DimeCons.dimen_48,
        height: DimeCons.dimen_48,
        child: Center(
            child: Text(
          _text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: DimeCons.dimen_20),
        )),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _checked ? Color(0xFF81A462) : Colors.white,
            border: Border.all(width: 2)),
      );
}
