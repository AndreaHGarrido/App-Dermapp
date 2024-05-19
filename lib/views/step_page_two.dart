import 'dart:io';

import 'package:derma_share/views/step_page_three.dart';
import 'package:flutter/material.dart';

class StepPageTwo extends StatelessWidget {
  StepPageTwo({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/3/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('web/assets/media/steps/3/MANO.png'),
                  width: 400,
                  height: 400,// Replace 'path/to/image.png' with the actual file path
                ),
                ImageIcon(
                    AssetImage('web/assets/media/steps/3/DESCRIPCION.png'), // Image source
                    size: 200, // Size of the icon
                    color: Colors.white
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    print('Button pressed');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StepPageThree()),
                    );
                  },
                  child: Text('Siguiente'),
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