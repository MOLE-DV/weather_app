import 'package:flutter/material.dart';
import 'package:weather_app/utils/custom_text.dart';

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
                      "Zobacz więcej",
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
