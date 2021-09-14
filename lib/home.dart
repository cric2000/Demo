import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:play_lab/dash_content.dart';
import 'package:play_lab/dashboard.dart';
import 'package:play_lab/login.dart';

Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);
 Color heading = Color(0xffEA8585);



class Home extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
       body: Center(
         child: SingleChildScrollView(
           child: Column(
             // crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget> [
               Container(
                 child: Text(
                   "Click on any one of the games to enter into the world of madness",
                   style: TextStyle(
                     color: Colors.pink[100],
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     fontFamily: "Quicksand",
                     height: 1.6,
                   ),),
                 padding: EdgeInsets.fromLTRB(70.0,45.0,70.0,30.0),
               ),
                Container(
                   child: Text("VALORANT",
                     style: TextStyle(
                       color: heading,
                       fontSize: 24,
                       fontWeight: FontWeight.w500,
                       height: 1.6,
                       fontFamily: "Quicksand",
                     ), ),
                   decoration: BoxDecoration(
                       border: Border(bottom: BorderSide(
                         color: Colors.white,
                         width: 2.0, // Underline thickness
                       ))
                   ),
                   margin: EdgeInsets.fromLTRB(70.0, 0, 70.0, 5.0),
                 ),GestureDetector(
         onTap: () {
           // Navigator.pushAndRemoveUntil(
           //   context,
           //   MaterialPageRoute(builder: (context) => Login()),
           //       (Route<dynamic> route) => false,
           // );
         },
         child: InkWell(
           onTap: () {},
           splashColor: Colors.white54,
           splashFactory: InkSplash.splashFactory,
           child: Container(
                   width: 300,
                   height: 180,
                   margin: EdgeInsets.all(30),
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                     // border: Border.all(
                     //   color: heading,
                     //   width: 3,
                     // ),
                     image: DecorationImage(
                       image: AssetImage("images/valorant.jpg"),
                       fit: BoxFit.cover,
                     ),
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10.0),
                   ),
                 ),
         ),
               ),
               Container(
                 child: Text("PUBG",
                   style: TextStyle(
                     color: heading,
                     fontSize: 24,
                     fontWeight: FontWeight.w500,
                     height: 1.6,
                     fontFamily: "Quicksand",
                   ), ),
                 margin: EdgeInsets.fromLTRB(70.0, 0, 70.0, 5.0),
                 decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                       color: Colors.white,
                       width: 2.0, // Underline thickness
                     ))
                 ),
               ),
               Container(
                 width: 300,
                 height: 180,
                 margin: EdgeInsets.all(30),
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                     // border: Border.all(
                     //   color: heading,
                     //   width: 3,
                     // ),
                   image: DecorationImage(
                     image: AssetImage("images/bgmi.jpg"),
                     fit: BoxFit.cover,
                   ),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),
               Container(
                 child: Text("CS-GO",
                   style: TextStyle(
                     color: heading,
                     fontSize: 24,
                     fontWeight: FontWeight.w500,
                     height: 1.6,
                     fontFamily: "Quicksand",
                   ), ),
                 margin: EdgeInsets.fromLTRB(70.0, 0, 70.0, 5.0),
                 decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                       color: Colors.white,
                       width: 2.0, // Underline thickness
                     ))
                 ),
               ),
               Container(
                 width: 300,
                 height: 180,
                 margin: EdgeInsets.all(30),
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   // border: Border.all(
                   //   color: heading,
                   //   width: 3,
                   // ),
                   image: DecorationImage(
                     image: AssetImage("images/csgo.jpg"),
                     fit: BoxFit.cover,
                   ),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),
               Container(
                 child: Text("FORTNITE",
                   style: TextStyle(
                     color: heading,
                     fontSize: 24,
                     fontWeight: FontWeight.w500,
                     height: 1.6,
                     fontFamily: "Quicksand",
                   ), ),
                 margin: EdgeInsets.fromLTRB(70.0, 0, 70.0, 5.0),
                 decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                       color: Colors.white,
                       width: 2.0, // Underline thickness
                     ))
                 ),
               ),
               Container(
                 width: 300,
                 height: 180,
                 margin: EdgeInsets.all(30),
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   // border: Border.all(
                   //   color: heading,
                   //   width: 3,
                   // ),
                   image: DecorationImage(
                     image: AssetImage("images/fortnite.jpg"),
                     fit: BoxFit.cover,
                   ),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),
               Container(
                 child: Text("FREE FIRE",
                   style: TextStyle(
                     color: heading,
                     fontSize: 24,
                     fontWeight: FontWeight.w500,
                     height: 1.6,
                     fontFamily: "Quicksand",
                   ), ),
                 margin: EdgeInsets.fromLTRB(70.0, 0, 70.0, 5.0),
                 decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                       color: Colors.white,
                       width: 2.0, // Underline thickness
                     ))
                 ),
               ),
               Container(
                 width: 300,
                 height: 180,
                 margin: EdgeInsets.all(30),
                 padding: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   // border: Border.all(
                   //   color: heading,
                   //   width: 3,
                   // ),
                   image: DecorationImage(
                       image: AssetImage("images/freefire.jpg"),
                      fit: BoxFit.cover,
                   ),
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),
             ],
           ),
         ),
       ),
      ),
    );
  }
}