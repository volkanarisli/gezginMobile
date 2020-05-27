import 'package:flutter/material.dart';
import 'package:gezginmobile/services/auth.dart';
import 'package:flutter_svg/svg.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;
  SingIn({this.toggleView});
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text fiels state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Giriş Yap',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Aramıza Katıl'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Image(
                    image: AssetImage('assets/images/mask-man.png'),
                    height: 250,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Enter a valid email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ char or long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);

                        if (result == null) {
                          setState(() => error = 'please supply a valid email');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
