import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class authentication extends StatefulWidget {
  const authentication({Key? key}) : super(key: key);
  static String id = 'screen1';

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  late int selectedRadio;
  late bool isChecked;
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
    isChecked = false;
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
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text('Enter your details below : '),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-Z]"),
                  ),
                ],
                controller: _text,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  errorText: _validate ? 'Name cannot be empty' : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.man),
                  hintText: 'Enter Username',
                  filled: true,
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Male'),
              leading: Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  setSelectedRadio(val!);
                },
              ),
            ),
            ListTile(
              title: Text('Female'),
              leading: Radio(
                value: 2,
                activeColor: Colors.orange,
                groupValue: selectedRadio,
                onChanged: (val) {
                  setSelectedRadio(val!);
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                'I Agree To The Terms & Conditions',
                style: TextStyle(),
              ),
              trailing: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
