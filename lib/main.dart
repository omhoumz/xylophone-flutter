import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final _player = AudioCache();

  final _colors = <Color>[
    Colors.indigo.shade300,
    Colors.indigo.shade400,
    Colors.indigo.shade500,
    Colors.indigo.shade600,
    Colors.indigo.shade700,
    Colors.indigo.shade800,
    Colors.indigo.shade900,
  ];

  void playSound(int soundNumber) {
    _player.play('note$soundNumber.wav');
  }

  Widget buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        child: Text(
          'Note $soundNumber',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade200,
          ),
        ),
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  List<Widget> buildKeys() {
    var allKeys = <Widget>[];

    for (int i = 0; i < _colors.length; i++) {
      allKeys.add(buildKey(color: _colors[i], soundNumber: i + 1));
    }

    return allKeys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(),
          ),
        ),
      ),
    );
  }
}
