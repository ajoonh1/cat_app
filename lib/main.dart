import 'package:flutter/material.dart';
import 'package:cat_app/shop.dart';
import 'package:cat_app/setting.dart';
import 'package:cat_app/pomodoro.dart';
import 'package:cat_app/coin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => setting()));
                },
                icon: Image.asset('asset/gear.png'),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => coin()));
                },
                icon: Image.asset('asset/coin.png'),
                iconSize: 20,
              )
            ],
          ),
          Column(
            children: [
              Image.asset(
                'asset/White_Ca.png',
                height: MediaQuery.of(context).size.width / 1.2,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => shop()));
                },
                icon: Image.asset('asset/shop.png'),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => shop()));
                },
                icon: Image.asset('asset/bag.png'),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Pomodoro()));
                },
                icon: Image.asset('asset/clock.png'),
                iconSize: 20,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
