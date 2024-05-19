import 'dart:io';

import 'package:derma_share/views/step_show_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StepSendData extends StatelessWidget {

    final File pathfile;

    StepSendData({required this.pathfile});

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('web/assets/media/steps/5/FONDO.png'), // Image path
                        fit: BoxFit.cover, // Cover the whole area
                    ),
                ),
                child: SafeArea(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                ImageIcon(
                                    AssetImage('web/assets/media/steps/5/LOGO-DERMA-SHARE1.png'),
                                    size: 50,
                                    color: Colors.black,// Replace 'path/to/image.png' with the actual file path
                                ),
                                SizedBox(height: 10),
                                Text(
                                    'Imagen subida',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),

                                ),
                                SizedBox(height: 10),
                                if(pathfile != null)
                                    Container(
                                        width: 350,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black, width: 2.3),
                                            borderRadius: BorderRadius.circular(20),

                                        ),
                                        child: Row(
                                            children: [
                                                Expanded(
                                                    child: SafeArea(
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
                                                                    )
                                                                ],
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                                Expanded(
                                                    child: SafeArea(
                                                        child: Center(
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                    Text(
                                                                        'La foto es adecuada',
                                                                        style: TextStyle(fontSize: 16),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    )
                                else
                                    Text('Imagen no encontrada'),
                                SizedBox(height: 20),
                                ImageIcon(
                                    AssetImage('web/assets/media/steps/5/CHECK.png'),
                                    size: 150,
                                    color: Colors.indigo,// Replace 'path/to/image.png' with the actual file path
                                ),
                                ImageIcon(
                                    AssetImage('web/assets/media/steps/5/DESCRIPCION.png'), // Image source
                                    size: 200, // Size of the icon
                                    color: Colors.black
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                        // Add your button press logic here
                                        print('Button pressed');
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => StepShowData(
                                                pathfile: pathfile,
                                                evaluation: 'F',
                                                results: '94%',
                                                dianostic: 'SAD',
                                                tip: 'nothing'
                                            )),
                                        );
                                    },
                                    child: Text('Ver resultados'),
                                ),
                                SizedBox( height: 20)
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}