import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task2/screen2.dart';

//enum genderSelect { Male, Female }
String genderReal = "xzzz";

class authentication extends StatefulWidget {
  const authentication({Key? key}) : super(key: key);
  static String id = 'screen1';

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  late int selectedRadio;

  late bool isChecked;
  late bool checkChecked;
  final _text = TextEditingController();
  bool _validate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
    isChecked = false;
    checkChecked = false;
    //genderReal = "xxx";
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
      backgroundColor: Color(0xffCECACA),
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
                  fillColor: Colors.white30,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            /*ListTile(
              title: Text('Male'),
              leading: Radio(
                value: genderSelect.Male,
                groupValue: _gender,
                activeColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    _gender = val!;
                  });
                },
              ),
            ),*/
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
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent),
                onPressed: () {
                  setState(() {
                    if (_text.text.isEmpty) {
                      _validate = true;
                      debugPrint(genderReal);
                    } else {
                      _validate = false;

                      //print();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return result(name: _text.text);
                          },
                        ),
                      );
                    }
                    //_text.text.isEmpty ? _validate = true : _validate = false;
                    //Navigator.pushNamed(context, result.id);
                  });
                },
                child: Image(
                    height: 150,
                    width: 250,
                    image: NetworkImage(
                        'https://s38924.pcdn.co/wp-content/uploads/2021/09/User-Registration-1-scaled-1-1360x692.jpg')),
              ),
            ),
            /*Image(
              image: NetworkImage(
                  'https://s38924.pcdn.co/wp-content/uploads/2021/09/User-Registration-1-scaled-1-1360x692.jpg'),
              height: 200,
              width: 250,
              fit: BoxFit.cover,
            )*/
          ],
        ),
      ),
    );
  }
}
