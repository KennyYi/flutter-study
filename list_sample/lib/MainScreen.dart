import 'package:flutter/material.dart';
import 'PictureView.dart';
import 'PictureController.dart';

class MainScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        var items = _buildItems();

        return new Scaffold(
            appBar: AppBar(
                title: Text('Kenny Example'),
            ),
            backgroundColor: Colors.white,
            body: new CustomScrollView(slivers: items,),
        );
    }

    List<PictureView> _buildItems() {

        var controller = PictureController.getInstance();
        int pictureCount = controller.getPictureCount();

        var pictureViews = new List<PictureView>();
        for (int i = 0; i < pictureCount; i++) {
            pictureViews.add(new PictureView(picture: controller.getPicture(i)));
        }

        return pictureViews;
    }
}