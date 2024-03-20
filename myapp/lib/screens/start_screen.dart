import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/start_login.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                color: Color.fromRGBO(255, 151, 168, 1),
                child: Center(
                  child: Image.asset(
                    "assets/images/start.png",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.3,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dash Date",
                              style: TextStyle(
                                fontFamily: "Mitr_Bold",
                                color: Color.fromRGBO(220, 79, 137, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Ready to start meeting people? Set up your dating profile today!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 17,
                                color: Color.fromRGBO(61, 61, 63, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 26),
                        child: Material(
                          color: Color.fromRGBO(220, 79, 137, 1),
                          borderRadius: BorderRadius.circular(14),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StartLogin(),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 16,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Get Start',
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}