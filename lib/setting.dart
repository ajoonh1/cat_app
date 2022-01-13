import 'package:flutter/material.dart';
import 'package:cat_app/provider/counts.dart';
import 'package:provider/provider.dart';
import 'package:cat_app/globals.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  bool value = false;

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  convert(int value) {
    context.read()<Check>().convert(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (context.watch<Check>().check == 0)
                  ? () {
                      context.read<Check>().on();
                    }
                  : () {
                      context.read<Check>().off();
                    },
              child: (context.watch<Check>().check == 0)
                  ? Text(
                      'NO MEOW',
                      style: TextStyle(
                        fontFamily: 'Kitto',
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    )
                  : Text(
                      'MEOW',
                      style: TextStyle(
                        fontFamily: 'Kitto',
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TOTAL FOCUS TIME',
                  style: TextStyle(fontFamily: 'Kitto', fontSize: 15),
                ),
                Text(
                  transformMilliSeconds(context.watch<Times>().totalTime),
                  style: TextStyle(fontFamily: 'Kitto', fontSize: 15),
                ),
              ],
            ),
            Text(
              'Made By @theohong',
              style: TextStyle(fontSize: 15, fontFamily: 'Kitto'),
            ),
          ],
        ),
      ),
    );
  }
}
