import 'package:flutter/material.dart';

class coin extends StatefulWidget {
  const coin({Key? key}) : super(key: key);

  @override
  _coinState createState() => _coinState();
}

class _coinState extends State<coin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Coin'),
    ));
  }
}
