import 'package:bj_regist/ui/regist/RegistUIViewModel.dart';
import 'package:flutter/material.dart';

class RegistUI extends StatefulWidget {
  const RegistUI({Key? key}) : super(key: key);

  @override
  _RegistUIState createState() => _RegistUIState();
}

class _RegistUIState extends State<RegistUI> {
  final _formKey = GlobalKey<FormState>();
  String _title = "Create Account";

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
    return Container();
  }
}
