import 'package:flutter/material.dart';
import './intro_page_item.dart';
import './page_transformer.dart';
import '../PictureController.dart';

class IntroPageView extends StatelessWidget {

    var controller = PictureController.getInstance();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: SizedBox.fromSize(
                    size: const Size.fromHeight(500.0),
                    child: PageTransformer(
                        pageViewBuilder: (context, visibilityResolver) {
                            return PageView.builder(
                                controller: PageController(viewportFraction: 0.85),
                                itemCount: controller.getPictureCount(),
                                itemBuilder: (context, index) {
                                    final item = controller.getPicture(index);
                                    final pageVisibility =
                                    visibilityResolver.resolvePageVisibility(index);

                                    return IntroPageItem(
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
}