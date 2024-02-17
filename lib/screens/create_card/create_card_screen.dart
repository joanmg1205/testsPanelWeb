import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/header.dart';

class CreateCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Body()
          ],
        ),
      ),
    );
  }
}
