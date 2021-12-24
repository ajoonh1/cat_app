import 'package:flutter/material.dart';

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);

  @override
  _shopState createState() => _shopState();
}

class _shopState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Shop'),
    ));
  }
}
