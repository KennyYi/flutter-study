import 'package:flutter/material.dart';
import '../PictureController.dart';
import './PageItem.dart';
import './PageTransformer.dart';

class PagerView extends StatefulWidget {

    PictureController controller;

    PagerView({
        @required this.controller,
    });

    @override
    State createState() => _PagerViewState();
}

class _PagerViewState extends State<PagerView> {

    bool _isComplete = false;

    @override
    Widget build(BuildContext context) {

        _isComplete = widget.controller.isLoadingComplete;

        if (!_isComplete) widget.controller.registCallback(_callback);

        return _isComplete?_pagerWidget():_progressWidget();
    }

    Widget _pagerWidget() {

        return Scaffold(
            body: Center(
                child: SizedBox.fromSize(
                    size: const Size.fromHeight(500.0),
                    child: PageTransformer(
                        pageViewBuilder: (context, visibilityResolver) {
                            return PageView.builder(
                                controller: PageController(viewportFraction: 0.85),
                                itemCount: widget.controller.getPictureCount(),
                                itemBuilder: (context, index) {
                                    final item = widget.controller.getPicture(index);
                                    final pageVisibility =
                                    visibilityResolver.resolvePageVisibility(index);

                                    return PageItem(
                                        picture: item,
                                        pageVisibility: pageVisibility,
                                    );
                                },
                            );
                        },
                    ),
                ),
            ),
        );
    }

    Widget _progressWidget() {

        return Container(
            child: Center(
                child: CircularProgressIndicator(),
            ),
        );
    }

    _callback() {
        setState(() => _isComplete = true);
    }
}
