import 'dart:io';

import 'package:derma_share/views/step_page_two.dart';
import 'package:flutter/material.dart';

class StepPageOne extends StatelessWidget {
  StepPageOne({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/2/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('web/assets/media/steps/2/MANO-CELULAR.png'),
                  width: 400,
                  height: 400,// Replace 'path/to/image.png' with the actual file path
                ),
                ImageIcon(
                    AssetImage('web/assets/media/steps/2/DESCRIPCION.png'), // Image source
                    size: 200, // Size of the icon
                    color: Colors.white
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    print('Button pressed');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StepPageTwo()),
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