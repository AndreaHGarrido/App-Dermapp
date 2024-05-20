import 'dart:io';
import 'dart:typed_data';

import 'package:derma_share/views/chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
      body:
      Screenshot(
        controller: screenshotController,
        child: Container(
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
                    onPressed: () async {
                      final image = await screenshotController.capture();

                      if(image == null){
                        const snackBar = SnackBar(
                          content: Text('No se puede guardar la imagen'),
                        );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }else{
                        await saveImage(image);
                        const snackBar = SnackBar(
                          content: Text('Imagen guardada en el escritorio!'),
                        );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text('Guardar resultados'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ChatBot()),
                      );
                    },
                    child: Text('Iniciar Chat con un medico virtual'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                      exit(0);
                    },
                    child: Text('Cancelar'),
                  ),
                  SizedBox( height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${this._twoDigits(now.month)}-${_twoDigits(now.day)}";
    final result = await ImageGallerySaver.saveImage(
      bytes,
      name: 'result_ss_'+formattedDate
    );
    return result['filepath'];
  }
  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}