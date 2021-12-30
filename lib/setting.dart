import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NOTIFIACTION',
                  style: TextStyle(fontSize: 20, fontFamily: 'Kitto'),
                ),
                Checkbox(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                  activeColor: Colors.grey[900],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
