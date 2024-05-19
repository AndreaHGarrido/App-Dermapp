import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

class StepShowData extends StatelessWidget {

  final File pathfile;
  final String evaluation;
  final String results;
  final String dianostic;
  final String tip;

  ScreenshotController screenshotController = ScreenshotController();


  StepShowData(
      {required this.pathfile,
        required this.evaluation,
        required this.results,
        required this.dianostic,
        required this.tip}
      );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/6/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('web/assets/media/steps/6/LOGO-DERMA-SHARE1.png'),
                  size: 50,
                  color: Colors.black,// Replace 'path/to/image.png' with the actual file path
                ),
                SizedBox(height: 30),
                SafeArea(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.file(
                          pathfile!,
                          fit: BoxFit.cover,
                          width: 75,
                          height: 75,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Evaluación de riesgos',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),

                ),
                Text(
                  this.evaluation,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Resultado',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),

                ),
                Text(
                  this.results,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Diagnostico',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),

                ),
                Text(
                  this.dianostic,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Consejo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),

                ),
                Text(
                  this.tip,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    screenshotController
                        .capture(delay: Duration(milliseconds: 10))
                        .then((capturedImage) async {
                      ShowCapturedWidget(context, capturedImage!);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Retorna un AlertDialog
                          return AlertDialog(
                            title: Text('Alerta'),
                            content: Text('Imagen capturada.'),
                            actions: <Widget>[
                              // Botón para cerrar el diálogo
                              TextButton(
                                child: Text('Cerrar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      print("Imagen capturada");
                    }).catchError((onError) {
                      print(onError);
                    });
                  },
                  child: Text('Guardar resultados'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    print('');
                  },
                  child: Text('Inicar Chat con un medico virtual'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    print('');
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox( height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }
}