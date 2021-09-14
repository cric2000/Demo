import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import "dart:async";
import 'package:play_lab/dashboard.dart';
import 'package:play_lab/home.dart';



Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);



class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   child: Lottie.network("https://assets8.lottiefiles.com/datafiles/U1I3rWEyksM9cCH/data.json",
              //   repeat: false ,  ),
              //   height: 150,
              // ),
              Container(
                child: Text(
                  "You have\nsuccessfully created\nyour account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_l7lbthdf.json",
                  repeat: false , animate: true , ),
                height: 139.0,
              ),
              Container(
                child: Text(
                  "You will be redirected to the dashboard in a few seconds",
                  style: TextStyle(
                    color: linkColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            title: Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text("Congrats",
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
    );
  }
}

