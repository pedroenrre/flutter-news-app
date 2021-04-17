import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/SignUp.dart';

import 'package:news_app/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print(_auth.currentUser);
  }

  FocusNode _emailFocusNode = FocusNode();

  void signIn() async {
    setState(() {
      isLoading = true;
    });
    final email = _controllerEmail.text;
    final pass = _controllerPassword.text;

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }).catchError((e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: height * 0.7,
          width: width,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'MobNews',
                style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.35,
              )
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * 0.7,
          width: width,
          decoration: new BoxDecoration(
              color: Colors.grey[50],
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(50.0),
                topRight: const Radius.circular(50.0),
              )),
          child: buildForms(context),
        ),
      )
    ]));
  }

  Widget buildForms(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: this._controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.mail_outline, color: Colors.black87),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black87),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                      validator: validateEmail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: this._controllerPassword,
                      autocorrect: false,
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock_outline, color: Colors.black87),
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.red))),
                      validator: validatePass,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (isLoading) return;
                            if (_formKey.currentState.validate()) {
                              signIn();
                            }
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.grey[50],
                                )
                              : Text('Login')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                        child: Text(
                          'NOVA CONTA',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Digite um email válido';
  else
    return null;
}

String validatePass(String value) {
  if (value == null || value.isEmpty)
    return 'Digite sua senha';
  else
    return null;
}
