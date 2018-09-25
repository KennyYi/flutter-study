import 'package:flutter/material.dart';
import '../Picture.dart';

class ReorderablePictureView extends StatelessWidget {

    final Picture picture;

    ReorderablePictureView({
        @required Key key,
        @required this.picture,
    }):super(key:key);

    @override
    Widget build(BuildContext context) {

        final double size = MediaQuery.of(context).size.width * 0.9;
        return _itemBody(size);
    }

    Widget _itemUser() {

        return Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(
                vertical: 5.5,
                horizontal: 5.5
            ),
            alignment: Alignment.bottomLeft,
            child: Row(
                children: <Widget>[
                    _getProfileImageWidget(),
                    Padding(padding: new EdgeInsets.all(10.0)),
                    Text(picture.user, style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                    )),
                ],
            ),
        );
    }

    Widget _itemBody(double size) {

        var gradient = DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                        const Color(0xFF000000),
                        const Color(0x00000000),
                        const Color(0x00000000),
                    ]
                ),
            ),
        );

        var image = Image.network(
            picture.path,
            fit: BoxFit.cover,
            alignment: FractionalOffset(
                0.5,
                0.5),
        );

        var box = Container(
            width: size,
            height: size,
            padding: const EdgeInsets.symmetric(
                vertical: 16.0,
//                horizontal: 8.0,
            ),
//            foregroundDecoration: gradient.decoration,
            child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                    alignment: Alignment.bottomLeft,
                    fit: StackFit.expand,
                    children: <Widget>[
                        image,
                        gradient,
                        _itemUser(),
                    ],
                ),
            ),
        );

        return box;
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