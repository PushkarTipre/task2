import 'package:flutter/material.dart';
import 'package:task2/screen2.dart';
import 'screen1.dart';
import 'mainScreen.dart';

void main() {
  runApp(const validate());
}

class validate extends StatelessWidget {
  const validate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: btnScreen.id,
      routes: {
        authentication.id: (context) => const authentication(),
        btnScreen.id: (context) => const btnScreen(),
        result.id: (context) => result(
              name: '', age: '',
              //gender: '',
            ),
      },
    );
  }
}
