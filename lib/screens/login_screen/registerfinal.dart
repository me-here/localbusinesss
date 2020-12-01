import 'package:flutter/material.dart';
import '../../services/authfinal.dart';
import '../../services/databasefinal.dart';
import '../../shared/constantsfinal.dart';
import '../../shared/loadingfinal.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String confirmation = '';
  String name = '';
  String dropdownValue = 'Consumer';
  bool business = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Local Business Supporter'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      'Create an Account',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Password too weak. Must be 6+ characters long.'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 15.0),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Confirm Password'),
                        obscureText: true,
                        validator: (val) => confirmation != password
                            ? 'Passwords must match.'
                            : null,
                        onChanged: (val) {
                          setState(() => confirmation = val);
                        }),
                    SizedBox(height: 20.0),
                    Text(
                      'I am a...',
                      style: TextStyle(fontSize: 24),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 30,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.deepOrangeAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Consumer', 'Business']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 30.0),
                    RaisedButton(
                      color: Colors.orange,
                      child: Text('Create an account',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                            business = (dropdownValue == 'Business');
                          });
                          dynamic result = await _auth
                              .createAccount(name, email, password, business)
                              .then((user) {
                            DatabaseService(uid: user.uid)
                                .updateUserData(name, business);
                          });
                          if (result == null) {
                            setState(() {
                              error = 'At least one of your inputs is invalid';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    FlatButton(
                      child: Text('Already have an account?'),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
