import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:play_lab/login.dart';
import 'package:play_lab/signup.dart';
import 'package:responsive_framework/responsive_framework.dart';



Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);

var _currentYear = DateTime.now().year;

class Welcome extends StatelessWidget {
  final Color heading = Color(0xffEA8585);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    print(screenSize.size);
    print(screenSize.devicePixelRatio);
    print(screenSize.size.height * screenSize.devicePixelRatio);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Greetings!\nYou have\nreached to the\nbest app of $_currentYear ",
                      style: TextStyle(
                        color: heading,
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        height: 1.8,
                      ),),
                    margin: const EdgeInsets.fromLTRB(18.0, 5.0, 0, 0),
                  ),
                  Container(
                    height: screenSize.size.height/6,
                    alignment: Alignment.topLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                       maxWidth: screenSize.size.width/4,
                      ),
                      child: Lottie.network(
                        "https://assets8.lottiefiles.com/animated_stickers/lf_tgs_mmszpbcv.json",
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    // child: Image(
                    //     image: AssetImage("images/among-us-6008615_1920.png"),
                    //   height: 85.0,
                    //   fit: BoxFit.cover,
                    //      ),
                  ),
                ],

              ),
            ),
            Container(
              child: Text("Just Kidding ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Let's create an account for you",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),),
              alignment: Alignment.center,
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
                  MaterialPageRoute(builder: (context) => Signup()),
                      (Route<dynamic> route) => false,
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Login()),
                // );
              },
              child: const Text("Let's Go",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text("Have we met before?Already have an account.",
                  style: TextStyle(
                    color: linkColor,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),),
              ),
            ),
          ],
        ),
        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            bottom: PreferredSize(
                child: Container(
                  color: Colors.white,
                  height: 3.0,
                ),
                preferredSize: Size.fromHeight(3.0)),
            title: Center(child: Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text("Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),),
            ),
            ),
            centerTitle: true,
            backgroundColor: bgColor,
          ),
        ),
      ),
    );
  }
}

