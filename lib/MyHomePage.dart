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
  List<int> ownedItems = [];
  var closet;
  late DynamicList listClass;

  @override
  void initState() {
    super.initState();
    closet = Provider.of<ListProvider>(context, listen: false);
    listClass = DynamicList(closet.items);
  }

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
        create: (BuildContext context) => ListProvider(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  alignment: Alignment.topRight,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => setting()));
                  },
                  icon: Image.asset('assets/gear.png'),
                  iconSize: 20,
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => shop()));
                  },
                  icon: Image.asset('assets/bag.png'),
                  iconSize: 20,
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: Swapping,
                  icon: Image.asset('assets/refresh.png'),
                  iconSize: 20,
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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

  Swapping() {
    Random random = new Random();
    var itemStocks = random.nextInt(closet.Length());
    ownedItems = closet.GetItems();
    var itemIndex = ownedItems[itemStocks];
    setState(() {
      hat = all_items[itemIndex];
    });
  }
}
