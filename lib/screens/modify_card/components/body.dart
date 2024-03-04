import 'package:admin/utils/wscalls.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late XFile imageLogo;
  int imageLogoAction = 1;
  late XFile imageHero;
  bool isImageHeroStamp = false;
  bool showImageHeroStamp = false;
  int imageHeroAction = 1;
  late XFile imageWordMark;
  int imageWordMarkAction = 1;
  TextEditingController _puntosiniciales = new TextEditingController();
  TextEditingController _nombrepuntos = new TextEditingController();
  TextEditingController _titulotarjeta = new TextEditingController();
  TextEditingController _subtitulotarjeta = new TextEditingController();
  bool showColors = false;
  Color color = Colors.blue;
  late Color colorSelector;
  String id = "2e98ff8e-0821-4584-93a9-f02c8f69a691_1708164934";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      Map<String, dynamic> data = await Wscalls.getClass(id);
      imageLogo = XFile(data['message'][1] == null ? "" : data['message'][1]);
      imageHero = XFile(data['message'][2] == null ? "" : data['message'][2]);
      imageWordMark = XFile(data['message'][3] == null ? "" : data['message'][3]);
      _puntosiniciales.text = data['message'][5].toString();
      _nombrepuntos.text = data['message'][6];
      _titulotarjeta.text = data['message'][7];
      _subtitulotarjeta.text = data['message'][8];
    } on Exception catch (e) {
      print("Programm error: $e");
    }
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
                      imageLogo = image;
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
                      imageHero = image;
                    });
                  }
                },
                label: Text('Subir')),
            Checkbox(
                value: isImageHeroStamp,
                onChanged: ((value) {
                  setState(() {
                    isImageHeroStamp = value!;
                  });
                }))
          ]),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  setState(() {
                    showImageHeroStamp = !showImageHeroStamp;
                  });
                },
                label: showImageHeroStamp == true ? Text('Esconder') : Text('Mostrar')),
          ]),
          showImageHeroStamp == true
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(defaultPadding),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                'Imagen destacada $index',
                              ),
                            ),
                            ElevatedButton.icon(
                                icon: Icon(Icons.image),
                                onPressed: () async {
                                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      imageHero = image;
                                    });
                                  }
                                },
                                label: Text('Subir')),
                          ],
                        );
                      }),
                )
              : Container(),
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
                      imageWordMark = image;
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
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  'Color de fondo',
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    colorSelector = color;
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
                                      color: colorSelector,
                                      pickersEnabled: {ColorPickerType.primary: false, ColorPickerType.accent: false, ColorPickerType.wheel: true},
                                      onColorChanged: (Color color) => setState(() {
                                            colorSelector = color;
                                          })),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                          child: Text('Cancel')),
                                      SizedBox(width: defaultPadding),
                                      TextButton(
                                          onPressed: (() {
                                            setState(() {
                                              color = colorSelector;
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
                  label: Text('Mostrar')),
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
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () async {
              String result = await Wscalls.updateClass(
                  imageLogo: imageLogo,
                  imageHero: imageHero,
                  imageWordMark: imageWordMark,
                  backgroundColor: color.hex,
                  pointsStart: _puntosiniciales.text,
                  pointsLabel: _nombrepuntos.text,
                  title: _titulotarjeta.text,
                  subtitle: _subtitulotarjeta.text,
                  stamp: isImageHeroStamp == true ? '1' : '0',
                  id: this.id);
              print(result);
            },
            icon: Icon(Icons.save),
            label: Text("Save changes"),
          ),
        ],
      ),
    );
  }
}
