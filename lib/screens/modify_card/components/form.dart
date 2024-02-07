import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:image_picker_web/image_picker_web.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();
  TextEditingController _controller5 = new TextEditingController();
  TextEditingController _controller6 = new TextEditingController();
  TextEditingController _controller7 = new TextEditingController();
  Color color = Colors.blue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // import initial data from here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diseño de la tarjeta',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: defaultPadding),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                'Imagen de logotipo',
              ),
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () async {
                  Image? fromPicker = await ImagePickerWeb.getImageAsWidget();
                },
                label: Text('Subir')),
          ]),
          SizedBox(height: defaultPadding),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                'Imagen destacada',
              ),
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () async {
                  Image? fromPicker = await ImagePickerWeb.getImageAsWidget();
                },
                label: Text('Subir')),
          ]),
          SizedBox(height: defaultPadding),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                'Imagen denominativa',
              ),
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () async {
                  Image? fromPicker = await ImagePickerWeb.getImageAsWidget();
                },
                label: Text('Subir')),
          ]),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: Text(
                  'Color de fondo',
                ),
              ),
              ColorPicker(
                  color: color,
                  pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                  onColorChanged: (Color color) => setState(() {
                        this.color = color;
                      })),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Datos de la tarjeta',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Puntos iniciales',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _controller4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                String newValue = '';
                for (var i = 0; i < value.length; i++) {
                  var c = value[i];
                  if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9') {
                    newValue += c;
                  }
                }
                _controller4.value = TextEditingValue(
                  text: newValue,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: newValue.length),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nombre de los puntos',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _controller5,
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
              'Titulo de la tarjeta',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _controller6,
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
              'Subtitulo de la tarjeta',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextField(
              controller: _controller7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
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
              onPressed: () {
                print(color.hexAlpha);
                print(color.hex);
                print(color);
              },
              icon: Icon(Icons.save),
              label: Text("Save changes"),
            ),
            SizedBox(
              width: defaultPadding,
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
      ),
    );
  }
}
