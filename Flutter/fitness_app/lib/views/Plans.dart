/* Copyright 2019 National Technology & Engineering Solutions of Sandia, LLC (NTESS). 
   Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains 
   certain rights in this software.
*/
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../globals.dart' as global;

class Plans extends StatelessWidget {
  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget build(BuildContext context) {
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
                  height: 15.0,
                ),
                Text("My Workout Plans")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<Map> loadData() async {
  final Uri url = Uri.http(
      "10.0.2.2:6001", "/api/v1/workout/owner/" + global.userId.toString());
  http.Response response =
      await http.get(url, headers: {"Accept": "application/json"});
  Map data = jsonDecode(response.body);
  return data;
}
