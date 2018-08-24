import 'package:flutter/material.dart';
import 'MainScreen.dart';

void main() => runApp(new KennyListApp());

class KennyListApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Kenny Example',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
//      home: new MainScreen(),
      home: new MainScreen(),
    );
  }
}

