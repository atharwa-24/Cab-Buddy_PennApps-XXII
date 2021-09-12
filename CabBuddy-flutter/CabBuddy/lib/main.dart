import 'package:flutter/material.dart';
import 'package:cabbuddy/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cabbuddy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cabbuddy/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FireUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


