import 'package:flutter/material.dart';
import 'package:weather_app/resources/global_resource.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/translations/translation.dart';

class CustomCardTopPanel extends StatelessWidget {
  String topPanelText;
  bool showSeeMoreButton;
  Widget? panelRightWidget;

  CustomCardTopPanel({
    super.key,
    required this.topPanelText,
    required this.showSeeMoreButton,
    this.panelRightWidget,
  });

  @override
  Widget build(BuildContext context) {
    Translation translation = GlobalResource.of(
      context,
    ).appTranslation.translations;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(topPanelText, style: Theme.of(context).textTheme.bodyLarge),
        showSeeMoreButton
            ? GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      translation.seeMore,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Icon(Icons.arrow_right, color: Colors.blueAccent),
                  ],
                ),
              )
            : SizedBox.shrink(),
        if (panelRightWidget != null) panelRightWidget!,
      ],
    );
  }
}
