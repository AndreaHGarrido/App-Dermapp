import 'package:derma_share/views/step_page_one.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context){

    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StepPageOne()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('web/assets/media/steps/1/FONDO.png'), // Image path
            fit: BoxFit.cover, // Cover the whole area
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BIENVENIDO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),

                ),
                ImageIcon(
                    AssetImage('web/assets/media/steps/1/LOGO.png'), // Image source
                    size: 400, // Size of the icon
                    color: Colors.white
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 10,
                  strokeAlign: 5,
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