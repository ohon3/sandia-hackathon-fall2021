/* Copyright 2019 National Technology & Engineering Solutions of Sandia, LLC (NTESS). 
   Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains 
   certain rights in this software.
*/
import 'dart:convert';
//import 'dart:html';
//import 'package:fitness_app/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';
import 'exercises.dart';
import 'dart:developer';
import 'navigation.dart';
import 'Plans.dart';
import '../globals.dart' as global;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Controllers
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          getLogin(context);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                emailField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(
                  height: 20.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  child: Text("SIGN UP"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getLogin(BuildContext context) async {
  var queryParameters = {
    'username': emailController.text,
    'password': passwordController.text,
  };
  final Uri url = Uri.http(global.serverUrl, "/api/v1/user/login");
  log(url.toString());
  http
      .post(url,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
          },
          body: jsonEncode(queryParameters))
      .then((response) {
    global.userId = json.decode(response.body)['id'];
    log(global.userId.toString());
    if (response.statusCode == 200) {
      if (response.body.contains("true")) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Navigation();
            },
          ),
        );
      }
    } else {
      throw Exception();
    }
  });
}
