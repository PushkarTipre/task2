import 'package:flutter/material.dart';
import 'package:task2/screen1.dart';

class btnScreen extends StatelessWidget {
  const btnScreen({Key? key}) : super(key: key);
  static String id = 'mainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(60.0),
                  side: BorderSide(width: 3, color: Colors.transparent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, authentication.id);
                },
                child: Text(
                  'Press to Register',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
