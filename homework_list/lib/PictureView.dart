import 'package:flutter/material.dart';
import 'Picture.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class PictureView extends StatelessWidget {

    final Picture picture;

    PictureView({
        @required this.picture,
    });

    @override
    Widget build(BuildContext context) {

        final double size = MediaQuery.of(context).size.width * 0.9;

        return new SliverStickyHeader(
            header: new Container(
                height: 60.0,
                color: Colors.white70,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerLeft,
                child: Material(
                    child: Container(
                        child: InkWell(
                            highlightColor: Colors.blueAccent,
                            splashColor: Colors.blueAccent,
                            child: new Row(
                                children: <Widget>[
                                    _getProfileImageWidget(),
                                    new Padding(padding: new EdgeInsets.all(10.0)),
                                    new Text(picture.user,
                                        style: new TextStyle(color: Colors.black87,),
                                    ),
                                ],
                            ),
                            onTap: () => print("${picture.user} name clicked"),
                        ),
                    ),
                )
            ),
            sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                        (context, i) => new ListTile(
                        title: Material(
                            child: Container(
                                child: InkWell(
                                    highlightColor: Colors.blueAccent,
                                    splashColor: Colors.blueAccent,
                                    child: new Image.network(picture.path, width: size, alignment: Alignment.center,),
                                    onTap: () => print("${picture.user} clicked"),
                                ),
                            ),
                        ),
                    ),
                    childCount: 1,
                )
            ),
        );
    }

    Widget _getProfileImageWidget() {

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