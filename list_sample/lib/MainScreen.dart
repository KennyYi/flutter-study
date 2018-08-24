import 'package:flutter/material.dart';
import 'PictureView.dart';
import 'PictureController.dart';
import 'Picture.dart';
import 'package:unicorndial/unicorndial.dart';

class MainScreen extends StatefulWidget {

    @override
    State createState() => _FilterState();
}

class _FilterState extends State<MainScreen> {

    int _filter = -1; // Index. -1 means no filter.

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
                            childButtons: _getFilters(),
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
            if (_filter == -1) {
                pictureViews.add(new PictureView(picture: controller.getPicture(i)));
            } else if (_filter == i) {
                pictureViews.add(new PictureView(picture: controller.getPicture(i)));
            }
        }

        return pictureViews;
    }

    List<UnicornButton> _getFilters() {

        var controller = PictureController.getInstance();
        int pictureCount = controller.getPictureCount();

        var filters = new List<UnicornButton>();
        
        filters.add(new UnicornButton(
            currentButton: FloatingActionButton(
                child: Text("All"),
                onPressed: () {
                    setState(() {
                        _filter = -1;
                    });
            }),
        ));
        
        for (int i = 0; i < pictureCount; i++) {

            filters.add(new UnicornButton(
                currentButton: FloatingActionButton(

                    child: _getProfileImageWidget(controller.getPicture(i)),
                    onPressed: () {
                        setState(() {
                            _filter = i;
                        });
                    },
                )
            ));
        }

        return filters;
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

