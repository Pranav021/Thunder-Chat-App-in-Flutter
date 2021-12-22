import 'package:flutter/material.dart';
import '../components/welcome_screen_buttons.dart';
import 'package:thunder_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thunder_chat_app/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String passwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  passwd = value;
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              WelcomeScreenButtons(
                color: Colors.lightBlueAccent,
                label: 'Log In',
                onpress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final User = await _auth.signInWithEmailAndPassword(
                        email: email, password: passwd);
                    if(User != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ChatScreen();

                      },),);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                  catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
