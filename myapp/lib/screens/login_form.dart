import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/signup_form.dart';
import 'package:myapp/screens/start_login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _obscureText = true;

  void _handleFormSubmit() {
    String phonenumber = _phonenumberController.text;
    String PassWord = _passController.text;
    _phonenumberController.clear();
    _passController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StartLogin(),
      ),
    );
  }

  @override
  void dispose() {
    _phonenumberController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          bool isLandscape = orientation == Orientation.landscape;
          bool shouldUseSafeArea = !isLandscape;

          return shouldUseSafeArea
              ? SafeArea(
                  child: _buildForm(context),
                )
              : _buildForm(context);
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingVertical = screenHeight * 0.05;
    final double paddingHorizontal = screenWidth * 0.05;
    final double spacing = 10;

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      clipBehavior: Clip.none,
      child: Padding(
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
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Icon(Icons.login,
                      size: 24, color: Color.fromRGBO(215, 215, 215, 1)),
                  SizedBox(width: 10),
                  Text('Log in',
                      style: TextStyle(
                          fontFamily: "Mitr_Bold",
                          fontSize: 22.0,
                          color: Color.fromRGBO(220, 79, 137, 1),
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(height: spacing),
            Text(
              "Welcome to us",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Ubuntu",
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
                    controller: _phonenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Color.fromRGBO(121, 121, 121, 0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 0.8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 0.8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 0.8),
                            width: 1.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  SizedBox(height: spacing),
                  Container(
                  child: TextField(
                    controller: _passController,
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: spacing),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color.fromRGBO(220, 79, 137, 1),
                      fontFamily: 'Ubuntu',
                      fontSize: 12)
                    )
                    // Phần code điều hướng sang trang xác minh và lập lại mật khẩu
                  ),
                  SizedBox(height: spacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>SignupForm()));
                        },
                        child: Text(
                          'Sign Up',
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
                    onPressed: _handleFormSubmit,
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
                      'Log In',
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
          ],
        ),
      ),
    );
  }
}