import 'package:flutter/material.dart';
import 'MainScreen.dart';
import './parallex/intro_page_view.dart';

void main() => runApp(new KennyListApp());

class KennyListApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Kenny Example',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new DefaultTabController(length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.view_list)),
                Tab(icon: Icon(Icons.swap_horiz)),
              ]),
              title: Text('Kenny Example'),
            ),
            body: TabBarView(children: [
              new MainScreen(),
              new IntroPageView()
            ]),
          ),
        )
    );
  }
}

