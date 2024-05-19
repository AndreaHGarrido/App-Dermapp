import 'dart:io';

import 'package:derma_share/views/step_send_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StepPageThree extends StatelessWidget {

  late String imagePath;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/4/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('web/assets/media/steps/4/CAPTURA-GRANO.png'),
                  width: 130,
                  height: 130,// Replace 'path/to/image.png' with the actual file path
                ),
                ImageIcon(
                    AssetImage('web/assets/media/steps/4/DESCRIPCION.png'), // Image source
                    size: 200, // Size of the icon
                    color: Colors.white
                ),
                ElevatedButton(
                  onPressed:  () {
                    _pickImageFromGallery(context);
                  },
                  child: Text('Tomar foto de la galeria'),
                ),
                SizedBox( height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        Future.delayed(Duration(seconds: 5), () {
          // Navigate to the next page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StepSendData(pathfile: File(pickedFile.path))),
          );
        });
      } else {
        print('No image selected.');
      }

  }
}