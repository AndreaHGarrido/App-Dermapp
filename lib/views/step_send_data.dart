import 'dart:io';

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
                                Image(
                                    image: AssetImage('web/assets/media/steps/5/LOGO-DERMA-SHARE1.png'),
                                    width: 70,
                                    height: 70,// Replace 'path/to/image.png' with the actual file path
                                ),
                                Text(
                                    "AAAAAAAAAA",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 5,
                                    ),

                                ),
                                Text(
                                    'Imagen subida',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                    ),

                                ),
                                Image(
                                    image: AssetImage('web/assets/media/steps/5/CHECK.png'),
                                    width: 150,
                                    height: 150,// Replace 'path/to/image.png' with the actual file path
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
                                    },
                                    child: Text('Ver resultados'),
                                ),
                                SizedBox( height: 50)
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}