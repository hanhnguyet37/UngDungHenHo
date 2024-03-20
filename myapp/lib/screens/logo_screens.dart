import 'package:flutter/material.dart';

class LogoScreen extends  StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 151, 168, 1),
      body: 
      Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Center(child:Image.asset(
        "assets/images/logo.png",
        alignment: Alignment.center
      ))
    )
    );
  }
}