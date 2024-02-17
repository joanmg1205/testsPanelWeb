import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/utils/wscalls.dart';
import 'package:flutter/material.dart';

class CreateCompanyBody extends StatefulWidget {
  const CreateCompanyBody({
    Key? key,
  }) : super(key: key);
  @override
  State<CreateCompanyBody> createState() => _CreateCompanyBodyState();
}

class _CreateCompanyBodyState extends State<CreateCompanyBody> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _passTypeIdentifier = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nombre de la compañia',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Numero de telefono',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pass Type Identifier',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _passTypeIdentifier,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () async {
              try {
                String result = await Wscalls.createCompany(_name.text, _phone.text, _passTypeIdentifier.text);
                print(result);
              } on Exception catch (e) {
                print(e);
              }
            },
            icon: Icon(Icons.save),
            label: Text("Save changes"),
          ),
        ],
      ),
    );
  }
}
