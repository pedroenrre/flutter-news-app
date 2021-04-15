import 'package:flutter/material.dart';
import 'package:news_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home.dart';
import 'package:news_app/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Nova Conta',
            style: TextStyle(color: Colors.grey[50]),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height * 0.7,
              width: width,
              color: Colors.blue,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Para criar sua conta, basta informar um email válido e sua senha',
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
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
                      ),
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
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              model.signUp(
                                  email: _controllerEmail.text,
                                  pass: _controllerPassword.text,
                                  onSuccess: () {
                                    print('cadastrou');
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()),
                                        (_) => false);
                                  },
                                  onFail: () {
                                    print('erro');
                                  });
                            },
                            child: model.isLoading
                                ? CircularProgressIndicator()
                                : Text('Cadastrar')),
                      );
                    }),
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
