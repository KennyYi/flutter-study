import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:unicorndial/unicorndial.dart';
import 'package:homework_list/slivered/PictureView.dart';
import '../PictureController.dart';
import '../Picture.dart';

class HeadStickListView extends StatefulWidget {

    final PictureController controller;

    /// https://github.com/dart-lang/sdk/issues/33076
    /// Dart has a bug now.
    HeadStickListView({
        @required this.controller,
    });

    @override
    State createState() => _FilterState();
}

class _FilterState extends State<HeadStickListView> {

    var _filterName = "";
    List<Picture> _items;

    @override
    Widget build(BuildContext context) {

        if (_items == null) {
            _items = widget.controller.getPictures();
        }

        return Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
                CustomScrollView(slivers: _buildItems(),),
                Container(
                    padding: new EdgeInsets.all(10.0),
                    child: UnicornDialer(
                        parentButton: Icon(Icons.filter_list),
                        childButtons: _getFilterButtons(),
                        onMainButtonPressed: () => print("onMainButtonPressed.. ")
                    ),
                ),
            ] ,
        );
    }

    List<PictureView> _buildItems() {

        var pictureViews = new List<PictureView>();
        for (Picture picture in _items) {

            if (_filterName == "" || _filterName == picture.user) {
                pictureViews.add(PictureView(picture: picture));
            }
        }

        return pictureViews;
    }

    List<UnicornButton> _getFilterButtons() {

        var filterButtons = new List<UnicornButton>();
        var filterMap = new HashSet<String>();

        filterMap.add("");
        filterButtons.add(new UnicornButton(
            currentButton: FloatingActionButton(
                child: Text("All"),
                onPressed: () => setFilter("")),
        ));

        for (Picture picture in _items) {
            var name = picture.user;

            if (filterMap.contains(name)) continue;
            else {
                filterMap.add(name);
                filterButtons.add(new UnicornButton(
                    currentButton: FloatingActionButton(
                        child: _getProfileImageWidget(picture),
                        onPressed: () => setFilter(name)),
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

    void setFilter(String name) {

        if (name == null) name = "";

        setState(() {
            print("setFilter($name)");
            _filterName = name;
            _items = widget.controller.getPictures();
        });
    }
}

