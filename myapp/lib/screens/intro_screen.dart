import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/logo_screens.dart';
import 'package:myapp/screens/start_screen.dart';

class IntroScreen extends StatelessWidget{
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        LogoScreen(),
        StartScreen()
      ]

    );
  }
}

