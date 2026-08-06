import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Future.delayed(Duration(milliseconds: 6400)).then((_){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(),
          ),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Timed App',
                style: TextStyle(
                    fontSize:25, color: Colors.indigo, fontWeight: FontWeight.bold
                )
            ),
            Lottie.asset('assets/splashAnimation.json', width:150, height:150),
          ],
        ),
      ),
    );
  }
}
