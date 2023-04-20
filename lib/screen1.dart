import 'package:flutter/material.dart';

class authentication extends StatefulWidget {
  const authentication({Key? key}) : super(key: key);
  static String id = 'screen1';

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  late int selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Authentication'),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            child: Text('Enter your details below : '),
          ),
          TextField(),
          Checkbox(value: false, onChanged: (bool? value) {}),
          Checkbox(value: false, onChanged: (bool? value) {}),
          Checkbox(value: false, onChanged: (bool? value) {}),
          Checkbox(value: false, onChanged: (bool? value) {}),
          ListTile(
            title: Text('Male'),
            leading: Radio(
              value: 1,
              groupValue: selectedRadio,
              onChanged: (val) {
                setSelectedRadio(val!);
              },
            ),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
              value: 2,
              groupValue: selectedRadio,
              onChanged: (val) {
                setSelectedRadio(val!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
