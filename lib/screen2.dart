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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/logo.png',
                  height: 230,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text(
                  'Your details are',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your entered Username is : ',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your entered Age is : ',
                      style: TextStyle(fontSize: 24.0)),
                  Text(age,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your selected Gender is : ',
                      style: TextStyle(fontSize: 24.0)),
                  Text(gender,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
