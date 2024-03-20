import 'package:flutter/material.dart';
import 'package:myapp/screens/signup_form.dart';
import 'package:myapp/screens/login_form.dart';

class StartLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 188, 211, 1),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  color: Color.fromRGBO(255, 188, 211, 1),
                  child: Center(
                    child: Image.asset(
                      "assets/images/startlogin.png",
                    ),
                  ),
                ),
                Column(
                  children: [
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Login or Sign up",
                            style: TextStyle(
                              fontFamily: "Mitr_Bold",
                              color: Color.fromRGBO(220, 79, 137, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Please select your preferred method to continue setting up your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 17,
                              color: Color.fromRGBO(61, 61, 63, 1),
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            width: MediaQuery.of(context).size.width - 16,
                            child: Material(
                              color: Color.fromRGBO(220, 79, 137, 1),
                              borderRadius: BorderRadius.circular(14),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginForm(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22),
                          Container(
                            width: MediaQuery.of(context).size.width - 16,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Color.fromRGBO(220, 79, 137, 1),
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupForm(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    'Sign up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(220, 79, 137, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}