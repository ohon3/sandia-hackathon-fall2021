/* Copyright 2019 National Technology & Engineering Solutions of Sandia, LLC (NTESS). 
   Under the terms of Contract DE-NA0003525 with NTESS, the U.S. Government retains 
   certain rights in this software.
*/

import 'dart:developer';
import 'package:flutter/material.dart';
import '../globals.dart' as global;
import 'add_exercise.dart';

class Exercises extends StatelessWidget {
  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget build(BuildContext context) {
    final addButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0x0000ff),
      child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddState();
                },
              ),
            );
          },
          child: Text(
            "Add Exercise",
            textAlign: TextAlign.center,
          )),
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
                Text("Exercises",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    height: 150.0,
                    child: GestureDetector(
                        onTap: () {
                          log("TEST");
                        },
                        child: Image.asset('assets/muscle.jpg',
                            fit: BoxFit.contain))),
                Text("Strength",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                    height: 150.0,
                    child: GestureDetector(
                        onTap: () {
                          log("TEST");
                        },
                        child: Image.asset('assets/stretch.jpg',
                            fit: BoxFit.contain))),
                Text("Flexibility",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                    height: 150.0,
                    child: GestureDetector(
                        onTap: () {
                          log("TEST");
                        },
                        child: Image.asset('assets/cardio.png',
                            fit: BoxFit.contain))),
                Text("Endurance",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15.0,
                ),
                addButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
