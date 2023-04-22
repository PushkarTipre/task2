import 'package:flutter/material.dart';
import 'screen1.dart';

class result extends StatelessWidget {
  result({Key? key, required this.name, required this.age}) : super(key: key);
  static String id = 'screen2';
  String name;
  String age;
  String gender = genderReal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Text(name),
              ),
              Container(
                height: 200,
                width: 200,
                child: Text(age),
              ),
              Container(
                height: 200,
                width: 200,
                child: Text(gender),
              )
            ],
          ),
        ],
      ),
    );
  }
}
