import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play_lab/welcome.dart';
import 'package:play_lab/app_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:play_lab/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:play_lab/dashboard.dart';
import 'package:play_lab/signup.dart';


Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp();
//   runApp(
//    MyApp()
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //    Provider<Authentication>(
    //       create: (_) => Authentication(FirebaseAuth.instance) ,
    //    ),
    //   StreamProvider(
    //     create: (context) => context.read<Authentication>().authStateChanges,
    //     initialData: null,
    //   ),
    //   ],
    return MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1800,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: TABLET),
            ResponsiveBreakpoint.resize(1400, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1800, name: DESKTOP),
          ],
        ),
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        home: Welcome(),
      );
  }
}

// class AuthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<User>();
//     if (user != null) {
//       return Dashboard();
//     } else {
//       return Welcome();
//     }
//   }
// }


