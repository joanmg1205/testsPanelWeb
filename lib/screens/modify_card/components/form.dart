import 'package:admin/utils/wscalls.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:image_picker/image_picker.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  late XFile imageLogotipo;
  late XFile imageDestacada;
  late XFile imageDenominativa;
  TextEditingController _puntosiniciales = new TextEditingController();
  TextEditingController _nombrepuntos = new TextEditingController();
  TextEditingController _titulotarjeta = new TextEditingController();
  TextEditingController _subtitulotarjeta = new TextEditingController();
  Color color = Colors.blue;
  String id = "0";
  
  @override
void initState() {
  super.initState();
  fetchData();
}

void fetchData() async {
  Map<String, dynamic> data = await Wscalls.getClass(id);
  setState(() {
    _puntosiniciales.text = data['pointsStart'];
    _nombrepuntos.text = data['pointsLabel'];
    _titulotarjeta.text = data['title'];
    _subtitulotarjeta.text = data['subtitle'];
  });
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
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      imageLogotipo = image;
                    });
                  }
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
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      imageDestacada = image;
                    });
                  }
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
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      imageDenominativa = image;
                    });
                  }
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
              controller: _puntosiniciales,
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
                _puntosiniciales.value = TextEditingValue(
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
              controller: _nombrepuntos,
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
              controller: _titulotarjeta,
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
              controller: _subtitulotarjeta,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Center(
            child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () async {
                String result = await Wscalls.updateClass(
                    imageLogo: imageLogotipo,
                    imageHero: imageDestacada,
                    imageWordMark: imageDenominativa,
                    backgroundColor: color.hex,
                    pointsStart: _puntosiniciales.text,
                    pointsLabel: _nombrepuntos.text,
                    title: _titulotarjeta.text,
                    subtitle: _subtitulotarjeta.text,
                    id: '0');
                print(result);
              },
              icon: Icon(Icons.save),
              label: Text("Save changes"),
            ),
          ),
        ],
      ),
    );
  }
}
