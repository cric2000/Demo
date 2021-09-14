

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play_lab/signup.dart';
import 'package:play_lab/success.dart';
import 'package:play_lab/welcome.dart';
import 'package:lottie/lottie.dart';


Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);


class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(200.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 300),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            obscureText: false,
                            decoration: InputDecoration(

                              labelText: "Enter username",

                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),

                            ),
                          ),
                        ),
                       padding: EdgeInsets.fromLTRB(0, 60.0, 0, 60.0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 300),
                          child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                suffixText: "Show",
                                suffixStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                labelText: "Enter password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.only(bottom: 20.0),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                onPressed: () {

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Success()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: const Text("Log in",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
              ),
              Container(
                child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_dp7lcigr.json",
                height: 150.0,
                ),
                alignment: Alignment.centerRight,
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("New to this world? Create an account.",
                    style: TextStyle(
                      color: linkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),
            ],
          ),
          backgroundColor: bgColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child: AppBar(
              title: Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text("Log in",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                  child: Container(
                    color: Colors.white,
                    height: 3.0,
                  ),
                  preferredSize: Size.fromHeight(3.0)),
              backgroundColor: bgColor,
            ),
          ),
        ),
      ),
    );
  }

}
