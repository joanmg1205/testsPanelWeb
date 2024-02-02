import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  List auxKey = [1, 2];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(),
            SizedBox(height: defaultPadding),
            TextFormField(),
            SizedBox(height: defaultPadding),
            TextFormField(),
            SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Auxiliary Fields'),
                    SizedBox(height: defaultPadding),
                    SizedBox(
                      height: 400,
                      width: 200,
                      child: ListView.builder(
                        itemCount: auxKey.length,
                        itemBuilder: (context, index) {
                          SizedBox(height: defaultPadding);
                          Column(
                            children: [
                              TextField(),
                              TextField(),
                              TextField(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Back Fields'),
                    SizedBox(height: defaultPadding),
                    SizedBox(
                      height: 400,
                      width: 200,
                      child: ListView.builder(
                        itemCount: auxKey.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: defaultPadding),
                              Text('hola'),
                            ],
                          );
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      onPressed: () {
                        print(auxKey);
                        setState(() {
                          auxKey.add(1);
                        });
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add New"),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.save),
                label: Text("Save changes"),
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.cancel),
                label: Text("Cancel changes"),
              ),
            ])
          ],
        ));
  }
}
