import 'package:flutter/material.dart';
import 'package:retrofit_flutter/signin.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('assets/images/admas_univ_logo.png'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Admas University Smart Attendance System",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40.0, fontFamily: 'Comforta', color: Colors.white),
          ),
          
        ],
      )),
    );
  }
}
