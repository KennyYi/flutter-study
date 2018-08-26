import 'package:flutter/material.dart';
import 'dart:collection';
import 'PictureView.dart';
import 'PictureController.dart';
import 'Picture.dart';
import 'package:unicorndial/unicorndial.dart';

class MainScreen extends StatefulWidget {

    @override
    State createState() => _FilterState();
}

class _FilterState extends State<MainScreen> {

    var _filterName = "";

    @override
    Widget build(BuildContext context) {

        var items = _buildItems();

        return new Scaffold(
            appBar: AppBar(
                title: Text('Kenny Example'),
            ),
            backgroundColor: Colors.white,
            body: new Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                    new CustomScrollView(slivers: items,),
                    new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: new UnicornDialer(
                            parentButton: Icon(Icons.filter_list),
                            childButtons: _getFilterButtons(),
                            onMainButtonPressed: () {
                                print("onMainButtonPressed.. ");
                            },
                        ),
                    ),
                ] ,
            ),
        );
    }

    List<PictureView> _buildItems() {

        var controller = PictureController.getInstance();
        int pictureCount = controller.getPictureCount();

        var pictureViews = new List<PictureView>();
        for (int i = 0; i < pictureCount; i++) {
            var name = controller.getPicture(i).user;

            if (_filterName == "") {
                pictureViews.add(new PictureView(picture: controller.getPicture(i)));
            } else if (_filterName == name) {
                pictureViews.add(new PictureView(picture: controller.getPicture(i)));
            }
        }

        return pictureViews;
    }

    List<UnicornButton> _getFilterButtons() {

        var controller = PictureController.getInstance();
        int pictureCount = controller.getPictureCount();
        var filterButtons = new List<UnicornButton>();
        var filterMap = new HashSet<String>();

        filterMap.add("");
        filterButtons.add(new UnicornButton(
            currentButton: FloatingActionButton(
                child: Text("All"),
                onPressed: () {
                    setState(() {
                        _filterName = "";
                    });
                }),
        ));

        for (int i = 0; i < pictureCount; i++) {

            var name = controller.getPicture(i).user;

            if (filterMap.contains(name)) continue;
            else {
                filterMap.add(name);
                filterButtons.add(new UnicornButton(
                    currentButton: FloatingActionButton(
                        child: _getProfileImageWidget(controller.getPicture(i)),
                        onPressed: () {
                            setState(() {
                                _filterName = name;
                            });
                        }),
                ));
            }
        }

        return filterButtons;
    }

    Widget _getProfileImageWidget(Picture picture) {

        if (picture.userIcon == null || picture.userIcon.isEmpty) {
            return new CircleAvatar(
                radius: 25.0,
                child: new Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40.0,
                ),
            );
        } else {
            return new Container(width: 50.0, height: 50.0,
                decoration: new BoxDecoration(shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(picture.userIcon)
                    ),
                ),
            );
        }
    }
}

