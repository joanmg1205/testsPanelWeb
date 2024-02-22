import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/utils/wscalls.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool primaryColorSelected = false;
  Color primaryColor = Colors.lightBlue;
  bool secondaryColorSelected = false;
  Color secondaryColor = Colors.lightBlue;
  bool tertiaryColorSelected = false;
  Color tertiaryColor = Colors.lightBlue;
  bool quaternaryColorSelected = false;
  Color quaternaryColor = Colors.lightBlue;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'Color Primario',
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Column(children: [
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  ColorPicker(
                                      color: primaryColor,
                                      pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                                      onColorChanged: (Color color) => setState(() {
                                            primaryColor = color;
                                          })),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              primaryColor = Colors.lightBlue;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Cancel')),
                                      SizedBox(width: defaultPadding),
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              primaryColorSelected = true;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Save')),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                  },
                  label: Text('Editar')),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'Color Secundario',
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Column(children: [
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  ColorPicker(
                                      color: secondaryColor,
                                      pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                                      onColorChanged: (Color color) => setState(() {
                                            secondaryColor = color;
                                          })),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              secondaryColor = Colors.lightBlue;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Cancel')),
                                      SizedBox(width: defaultPadding),
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              secondaryColorSelected = true;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Save')),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                  },
                  label: Text('Editar')),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'Color Terciario',
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Column(children: [
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  ColorPicker(
                                      color: tertiaryColor,
                                      pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                                      onColorChanged: (Color color) => setState(() {
                                            tertiaryColor = color;
                                          })),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              tertiaryColor = Colors.lightBlue;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Cancel')),
                                      SizedBox(width: defaultPadding),
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              tertiaryColorSelected = true;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Save')),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                  },
                  label: Text('Editar')),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'Color Quaternary',
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Column(children: [
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  ColorPicker(
                                      color: quaternaryColor,
                                      pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                                      onColorChanged: (Color color) => setState(() {
                                            quaternaryColor = color;
                                          })),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              quaternaryColor = Colors.lightBlue;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Cancel')),
                                      SizedBox(width: defaultPadding),
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              quaternaryColorSelected = true;
                                            });
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Save')),
                                    ],
                                  ),
                                ]),
                              ),
                            ));
                  },
                  label: Text('Editar')),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Stack(
            children: [
              SizedBox(
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                width: 300,
                height: 200,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
              )
            ],
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
                if (primaryColorSelected && secondaryColorSelected && tertiaryColorSelected && quaternaryColorSelected) {
                  String result = await Wscalls.createForm('7b69a02f-89a7-417d-9729-54d7ed59eb12_1708189716', primaryColor.hex, secondaryColor.hex, tertiaryColor.hex, quaternaryColor.hex);
                  print(result);
                } else {
                  print('asd');
                }
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
