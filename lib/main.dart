import 'package:cat_app/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cat_app/provider/counts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counts()),
        ChangeNotifierProvider(create: (_) => Times()),
        ChangeNotifierProvider(create: (_) => Check()),
        ChangeNotifierProvider<ListProvider>(
            create: (context) => ListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}
