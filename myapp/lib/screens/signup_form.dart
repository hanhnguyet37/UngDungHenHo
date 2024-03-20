import 'package:flutter/material.dart';
import 'package:myapp/screens/verifycode.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isValidPhone(String phonenumber) {
    final RegExp phonenumberRegex =
        RegExp(r'^(032|033|034|035|036|037|038|039|096|097|098|086|083|084|085|081|082|088|091|094|070|079|077|076|078|090|093|089|056|058|092|059|099)[0-9]{7}$');
    return phonenumberRegex.hasMatch(phonenumber);
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool _isEmailValid = true;
  bool _isNameValid = true;
  bool _isPhoneValid = true;
  bool _autoValidate = false;

  void _handleFormSubmit() {
  String name = _nameController.text;
  String email = _emailController.text;
  String phonenumber = _phonenumberController.text;

  if (name.isEmpty) {
    setState(() {
      _isNameValid = false;
      _autoValidate = true;
    });
  } else {
    setState(() {
      _isNameValid = true;
    });
  }

  if (!_isValidEmail(email)){
    setState(() {
      _isEmailValid = false; 
      _autoValidate = true;
    });
    return;
  } else {
    setState(() {
      _isEmailValid = true;
    });
  }

  if (!_isValidPhone(phonenumber)) {
    setState(() {
      _isPhoneValid = false; 
      _autoValidate = true;
    });
    return;
  } else {
    setState(() {
      _isPhoneValid = true;
    });
  }

  _nameController.clear();
  _phonenumberController.clear();
  _emailController.clear();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Processing Data')),
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VerifyCode(),
    ),
  );
}

  @override
  void dispose() {
    _nameController.dispose();
    _phonenumberController.dispose();
    _emailController.dispose();
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
                  child: _buildForm(),
                )
              : _buildForm();
        },
      ),
    );
  }

  Widget _buildForm() {
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
                  Icon(Icons.contacts,
                      size: 24, color: Color.fromRGBO(215, 215, 215, 1)),
                  SizedBox(width: 10),
                  Text('Sign Up',
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
              "Create an account now to experience the service",
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
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full name',
                      labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Color.fromRGBO(121, 121, 121, 0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: _isNameValid ? Colors.grey : Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(220, 79, 137, 1),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(220, 79, 137, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 1),
                            width: 1.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    autovalidateMode: _autoValidate
                    ?AutovalidateMode.always
                    :AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _phonenumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Color.fromRGBO(121, 121, 121, 0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: _isPhoneValid ? Color.fromRGBO(220, 79, 137, 0.8): Colors.red),
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
                     autovalidateMode: _autoValidate
                    ?AutovalidateMode.always
                    :AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an phone';
                      } else if (!_isValidPhone(value)) {
                        return 'Please enter a valid phone';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Color.fromRGBO(121, 121, 121, 0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: _isEmailValid ? Colors.grey : Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 0.8),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color:Color.fromRGBO(220, 79, 137, 0.8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(220, 79, 137, 1),
                            width: 1.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                     autovalidateMode: _autoValidate
                    ?AutovalidateMode.always
                    :AutovalidateMode.disabled,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!_isValidEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              padding: EdgeInsets.symmetric(vertical: 20),
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
                  'Continue',
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