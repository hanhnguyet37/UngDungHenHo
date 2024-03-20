import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/login_form.dart';
import 'package:myapp/screens/signup_form.dart';

class VerifyPass extends StatefulWidget {
  @override
  _VerifyPassState createState() => _VerifyPassState();
}
class _VerifyPassState extends State<VerifyPass> {
  final TextEditingController _passController = TextEditingController();
  bool _isTermsChecked = false;

  void _handleFormSubmit() {
    String pass = _passController.text;

    //
    _passController.clear();
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoginForm(),
    ));
  }

  @override
  void dispose() {
    _passController.dispose();
    super.dispose();
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
              'Please create a password. This password will be used for future logins',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 15,
                color: Color.fromRGBO(61, 61, 63, 1),
              ),
            ),
            SizedBox(height: spacing),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Color.fromRGBO(121, 121, 121, 0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 1)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 1),
                            width: 1.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ), 
                ],
              ),
            ),
            SizedBox(height: spacing),
            Row( 
                children: [ Checkbox(
                    value: _isTermsChecked,
                    onChanged: (value) {
                      setState(() {
                        _isTermsChecked = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                    'I have read and agree to DashDate privacy policy and term of service.',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    )
                  ),]
                ),
            SizedBox(height: spacing),
            Container(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _isTermsChecked
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      }
                    : null,
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
        ));
      }
    }
