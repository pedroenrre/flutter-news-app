import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();

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
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Login')),
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
