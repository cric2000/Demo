import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:play_lab/dashboard.dart';
import 'package:play_lab/login.dart';
import 'package:play_lab/success.dart';
import 'package:lottie/lottie.dart';
import 'package:play_lab/app_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:play_lab/authentication.dart';

Color bgColor = Color(0xff151515);
Color linkColor = Color(0xff888888);



class Signup extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final requiredValidator = RequiredValidator(errorText: '*Required');
   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

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
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(width: 300),
                                  child: TextFormField(
                                    controller: nameController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
                                    ],
                                    // validator: requiredValidator,
                                    validator: (value) =>
                                    value!.isEmpty || value.length<3 ? '*Required' : null,
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Enter Name",
                                      hintText: "min 3 char long",
                                      hintStyle: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                      errorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white, width: 1.0),
                                      ),
                                      focusedErrorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.blueGrey, width: 1.0),
                                      ),
                                      errorStyle:   TextStyle(
                                        color: Colors.lightGreenAccent,
                                        fontSize: 16,
                                      ),
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
                            padding: EdgeInsets.only(bottom: 70.0),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 300),
                              child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) =>
                                  value!.isEmpty || value.length<6 ? '*Required' : null,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "Your Password",
                                    hintText: "min 6 char long",
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    errorStyle:   TextStyle(
                                      color: Colors.lightGreenAccent,
                                      fontSize: 16,
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedErrorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.blueGrey, width: 1.0),
                                    ),
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
                            padding: EdgeInsets.only(bottom: 70.0),
                          ),
                          Container(
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 300),
                              child: TextFormField(
                                  controller: emailController,
                                  // validator: requiredValidator,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(RegExp(r"\s")),
                                  ],
                                  validator: (val) => val!.isEmpty || !val.contains("@") || !val.contains(".com")
                                      ? "*enter a valid email"
                                      : null,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: "Enter email",
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedErrorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.blueGrey, width: 1.0),
                                    ),
                                    errorStyle:   TextStyle(
                                      color: Colors.lightGreenAccent,
                                      fontSize: 16,
                                    ),
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
                  ),
                ),
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
                onPressed:(){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignupSecond()),
                          (Route<dynamic> route) => false,
                    );
                  }else{
                    print("Not Validated");
                  }

                  // // if (_formKey.currentState!.validate()) {
                  // //   Navigator.pushAndRemoveUntil(
                  // //           context,
                  // //           MaterialPageRoute(builder: (context) => SignupSecond()),
                  // //               (Route<dynamic> route) => false,
                  // //         );
                  // // }else{
                  // //   print("Not Validated");
                  // // }
                  // final String email = emailController.text.trim();
                  // final String password = passwordController.text.trim();
                  // if(email.isEmpty){
                  //   print("email is empty");
                  // }
                  // else if(password.isEmpty){
                  //   print("password is empty");
                  // }
                  // else{
                  //   context.read<Authentication>().signup(
                  //     email,
                  //     password,
                  //   );
                  },
                child: const Text("Next",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
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
                child: Text("Sign Up",
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





class SignupSecond extends StatelessWidget  {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final requiredValidator = RequiredValidator(errorText: '*Required');

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
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Now,type in a  cool username. We don’t want you to be called by your real name.",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.6,
                            color: linkColor,
                          ),),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 300),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                                validator: requiredValidator,
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: "Enter username",
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white, width: 1.0),
                                  ),
                                  focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.blueGrey, width: 1.0),
                                  ),
                                  errorStyle:   TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontSize: 16,
                                  ),
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
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_miseizxc.json",
                  height: 150.0,
                ),
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
                // onPressed: () {
                //
                //   Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => SignupThird()),
                //         (Route<dynamic> route) => false,
                //   );
                // },
                onPressed:(){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignupThird()),
                          (Route<dynamic> route) => false,
                    );
                  }else{
                    print("Not Validated");
                  }
                },
                child: const Text("Next",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
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
                  child: Text("Forgot Something? Go back",
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
                child: Text("Sign Up",
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

class SignupThird extends StatelessWidget {

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
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: PreferredSize(
                  preferredSize: Size.fromHeight(200.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: Text("One final step.",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),),
                      ),
                      Container(
                        child: Text("Let’s link some apps to your account for the best experience.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: linkColor,
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black26,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Container(
                        child :  Image(
                          image: AssetImage("images/youtube.png"),
                          height: 30.0,
                        ),
                      ),
                      Container(
                        child: const Text("Link YouTube",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black26,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Container(
                         // child :  Icon(
                         //    MyFlutterApp.spotify,
                         //  ),
                        child :  Image(
                          image: AssetImage("images/spotify.png"),
                          height: 30.0,
                        ),
                      ),
                      Container(
                        child: const Text("Link Spotify",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child:  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black26,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Container(
                        child :  Image(
                          image: AssetImage("images/twitch.png"),
                          height: 30.0,
                        ),
                      ),
                      Container(
                        child: const Text("Link Twitch",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),),
                      ),

                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
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
                child: const Text("Next",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("Skip to dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
                child: Text("Sign Up",
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



