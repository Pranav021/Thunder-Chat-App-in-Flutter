import 'package:flutter/material.dart';
import 'package:thunder_chat_app/screens/welcome_screen.dart';
import 'package:thunder_chat_app/screens/login_screen.dart';
import 'package:thunder_chat_app/screens/registration_screen.dart';
import 'package:thunder_chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ThunderChat());
}

class ThunderChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/registration_screen': (context) => RegistrationScreen(),
        '/chat_screen': (context) => ChatScreen(),
      },
    );
  }
}
