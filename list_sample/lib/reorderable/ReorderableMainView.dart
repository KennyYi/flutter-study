import 'package:flutter/material.dart';
import 'package:flutter_list_drag_and_drop/drag_and_drop_list.dart';
import './ReorderablePictureView.dart';
import '../PictureController.dart';
import '../Picture.dart';

class ReorderableMainView extends StatefulWidget {

    final PictureController controller;

    ReorderableMainView({
        @required this.controller,
    });

    @override
    State createState() => _OrderState();
}

class _OrderState extends State<ReorderableMainView> {

    List<Picture> _items;

    @override
    Widget build(BuildContext context) {

        if (_items == null) {
            _items = widget.controller.getPictures();
        }

        // Default widget
        return ReorderableListView(
            children: _getChildren(),
            onReorder: _reorder,
        );

        // Open source library
        /*
        return DragAndDropList(_items,
            itemBuilder: (BuildContext context, item) {
                return ReorderablePictureView(key: item.getKey(), picture: item);
            },
            canBeDraggedTo: (oldIndex, newIndex) => true,
            dragElevation: 8.0,
            tilt: 0.05,
            onDragFinish: _reorder
        );
        */
    }

    List<ReorderablePictureView> _getChildren() {

        var views = new List<ReorderablePictureView>();

        for (Picture item in _items) {
            views.add(ReorderablePictureView(key: item.getKey(), picture: item));
        }

        return views;
    }

    void _reorder(int oldIndex, int newIndex) {

        setState(() {
            PictureController.getInstance().reorder(oldIndex, newIndex);
            _items = widget.controller.getPictures();
        });
    }
}