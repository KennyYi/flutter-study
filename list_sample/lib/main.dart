import 'package:flutter/material.dart';

import './PictureController.dart';
import './parallex/PagerView.dart';
import './reorderable/ReorderableMainView.dart';

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
//              new IntroPageView(controller: controller),
                        new PagerView(controller: controller),
                        new ReorderableMainView(controller: controller),
                    ]),
                ),
            )
        );
    }
}

