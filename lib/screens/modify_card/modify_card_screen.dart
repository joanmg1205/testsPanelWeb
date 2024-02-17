import 'package:admin/screens/modify_card/components/form_screen.dart';
import 'package:admin/screens/modify_card/components/header.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';

class ModifyCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding,),
            FormComponent()
          ],
        ),
      ),
    );
  }
}