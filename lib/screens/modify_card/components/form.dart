import 'package:flutter/gestures.dart';
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
  ScrollController _scrollController1 = new ScrollController();
  ScrollController _scrollController2 = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // import initial data from here
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Organization Name',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description',
              ),
            ),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Logo Text',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
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
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _scrollController1 ,
                        child: ListView.builder(
                          controller: _scrollController1,
                          itemCount: auxKey.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Key',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Label',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Value',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _scrollController2 ,
                        child: ListView.builder(
                          controller: _scrollController2,
                          itemCount: auxKey.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Key',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Label',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Value',
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
