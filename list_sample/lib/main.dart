import 'package:flutter/material.dart';
import 'package:homework_list/slivered/HeadStickListView.dart';
import './parallex/intro_page_view.dart';
import './reorderable/ReorderableMainView.dart';
import './PictureController.dart';

void main() => runApp(new KennyListApp());

class KennyListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    PictureController controller = PictureController.getInstance();

    return MaterialApp(
        title: 'Kenny Example',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
//        home: new DefaultTabController(length: 3,
        home: new DefaultTabController(length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
//                Tab(icon: Icon(Icons.view_list)),
                Tab(icon: Icon(Icons.swap_horiz)),
                Tab(icon: Icon(Icons.list)),
              ]),
              title: Text('Kenny Example'),
            ),
            body: TabBarView(children: [
//              new HeadStickListView(controller: controller),
              new IntroPageView(controller: controller),
              new ReorderableMainView(controller: controller),
            ]),
          ),
        )
    );
  }
}

