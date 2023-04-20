import 'package:flutter/material.dart';
import 'screen1.dart';

void main() {
  runApp(const validate());
}

class validate extends StatelessWidget {
  const validate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: authentication.id,
      routes: {authentication.id: (context) => authentication()},
    );
  }
}
