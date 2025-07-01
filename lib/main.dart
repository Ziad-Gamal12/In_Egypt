import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const InEgypt());
}

class InEgypt extends StatelessWidget {
  const InEgypt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Scaffold());
  }
}
