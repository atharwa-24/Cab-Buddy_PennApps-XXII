import 'package:cabbuddy/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cabbuddy/services/auth.dart';
import 'package:cabbuddy/shared/decoration.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String error = '';
  String password = 'cabbuddy';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text('Cab Buddy'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[900],
                backgroundImage: AssetImage('assets/cb.png'),
                radius: 85.0,
              ),
              SizedBox(height: 40.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Cab ID'),
                validator: (val) => val.isEmpty ? 'Enter cab ID + @cb.com' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 30.0,),
              RaisedButton(
                color: Colors.grey[600],
                child: Text(
                  'Sign-in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInEmailPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign-in';
                        loading =  false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
