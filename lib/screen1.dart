import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task2/screen2.dart';

//enum genderSelect { Male, Female }
String genderReal = "";

class authentication extends StatefulWidget {
  const authentication({Key? key}) : super(key: key);
  static String id = 'screen1';

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  late bool isChecked;
  late bool checkChecked;
  final _textControl = TextEditingController();
  final _ageControl = TextEditingController();
  bool _validateName = false;
  bool _validateAge = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = false;
    checkChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Authentication'),
      ),
      backgroundColor: Color(0xffCECACA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 30, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/logo.png',
                      height: 80.0,
                    ),
                  ),
                  Text(
                    'Enter your details below : ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-Z]"),
                  ),
                ],
                controller: _textControl,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  errorText: _validateName ? 'Name cannot be empty' : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.man),
                  hintText: 'Enter Username',
                  filled: true,
                  fillColor: Colors.white30,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9]"),
                  ),
                ],
                controller: _ageControl,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: _validateAge ? 'Age cannot be empty' : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.man),
                  hintText: 'Enter Age',
                  filled: true,
                  fillColor: Colors.white30,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Male'),
              leading: Radio(
                value: "Male",
                activeColor: Colors.green,
                groupValue: genderReal,
                onChanged: (value) {
                  //setSelectedRadio(value);
                  setState(() {
                    genderReal = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Female'),
              leading: Radio(
                value: "Female",
                activeColor: Colors.orange,
                groupValue: genderReal,
                onChanged: (value) {
                  //setSelectedRadio(value);
                  setState(() {
                    genderReal = value.toString();
                  });
                },
              ),
            ),
            /*ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                'I Agree to the Terms & Conditions',
                style: TextStyle(),
              ),
              trailing: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  isChecked = value!;
                },
              ),
            ),*/
            FormField(
              builder: (state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I Agree to the Terms & Conditions',
                        style: TextStyle(fontSize: 20)),
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = value!;
                          state.didChange(value);
                        }),
                  ],
                ); // Checkbox
              },
            ), //
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                ),
                onPressed: () {
                  setState(() {
                    if (_textControl.text.isEmpty || _ageControl.text.isEmpty) {
                      _validateName = true;
                      _validateAge = true;
                    } else {
                      _validateName = false;
                      _validateAge = false;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return result(
                              name: _textControl.text,
                              age: _ageControl.text,
                            );
                          },
                        ),
                      );
                    }
                    //_text.text.isEmpty ? _validate = true : _validate = false;
                    //Navigator.pushNamed(context, result.id);
                  });
                },
                child: Image.asset(
                  'images/reg.png',
                  height: 120.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
