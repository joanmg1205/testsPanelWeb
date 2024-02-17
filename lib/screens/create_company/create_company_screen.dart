import 'package:admin/constants.dart';
import 'package:admin/screens/create_company/components/body.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';

class CreateCompanyScreen extends StatelessWidget {
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
            CreateCompanyBody(),
          ],
        ),
      ),
    );
  }
}
