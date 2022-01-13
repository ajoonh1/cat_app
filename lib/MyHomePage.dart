import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cat_app/globals.dart';
import 'package:cat_app/provider/counts.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/shop.dart';
import 'package:cat_app/setting.dart';
import 'package:cat_app/pomodoro.dart';
import 'package:cat_app/coin.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var hat = 'assets/null.png';
  var acc = 'assets/null.png';
  var glasses = 'assets/null.png';

  void PlaySound(String soundName) {
    final _player = AudioCache();
    _player.play(soundName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => Counts(),
        child: Column(
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
                  icon: Image.asset('assets/gear.png'),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => coin()));
                  },
                  icon: Image.asset('assets/coin.png'),
                  iconSize: 20,
                )
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/White_Ca.png',
                  height: MediaQuery.of(context).size.width / 1.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
                Image.asset(
                  glasses,
                  height: MediaQuery.of(context).size.width / 1.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
                Image.asset(
                  acc,
                  height: MediaQuery.of(context).size.width / 1.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
                Image.asset(
                  hat,
                  height: MediaQuery.of(context).size.width / 1.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
                IconButton(
                    onPressed: (context.watch<Check>().check == 1)
                        ? () {
                            PlaySound('meow.m4a');
                          }
                        : null,
                    splashColor: Colors.white,
                    highlightColor: Colors.white,
                    icon: Image.asset('assets/null.png'),
                    iconSize: MediaQuery.of(context).size.width / 1.8),
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
                  icon: Image.asset('assets/bag.png'),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: Swaping,
                  icon: Image.asset('assets/refresh.png'),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Pomodoro()));
                  },
                  icon: Image.asset('assets/clock.png'),
                  iconSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Swaping() {
    Random random = new Random();
    var numberHats = random.nextInt(hat_items.length);
    var numberAccs = random.nextInt(acc_items.length);
    setState(() {
      hat = hat_items[numberHats];
      acc = acc_items[numberAccs];
    });
  }
}
