import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:myapp/screens/signup_form.dart';
import 'package:myapp/screens/verifypass.dart';

class VerifyCode extends StatefulWidget {
  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final List<TextEditingController> _codeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  int _countdown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Dispose the text editing controllers
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  String getFormattedCountdown() {
    int minutes = _countdown ~/ 60;
    int seconds = _countdown % 60;
    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingVertical = screenHeight * 0.05;
    final double paddingHorizontal = screenWidth * 0.05;
    final double spacing = 12;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupForm()),
            );
          },
        ),
        title: Text(
          'Verify your account',
          style: TextStyle(
            fontFamily: "Mitr_Bold",
            fontSize: 24.0,
            color: Color.fromRGBO(220, 79, 137, 1),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        padding: EdgeInsets.fromLTRB(
          paddingHorizontal,
          paddingVertical,
          paddingHorizontal,
          paddingVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Please enter the 4-digit activation code that has been sent to your phone number',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 15,
                color: Color.fromRGBO(61, 61, 63, 1),
              ),
            ),
            SizedBox(height: spacing),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 54,
                        width: 75,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          onChanged: (value) {
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          controller: _codeControllers[index],
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            color: Color.fromRGBO(61, 61, 63, 1),
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(220, 79, 137, 0.8),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: spacing),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                getFormattedCountdown(),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: spacing),
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haven't received OTP yet?",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // Gửi lại OTP
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 12,
                            color: Color.fromRGBO(220, 79, 137, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: spacing),
            Container(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerifyPass()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(220, 79, 137, 1),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}