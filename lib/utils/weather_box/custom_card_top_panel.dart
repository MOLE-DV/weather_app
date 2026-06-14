import 'package:flutter/material.dart';
import 'package:weather_app/utils/custom_text.dart';

class CustomCardTopPanel extends StatelessWidget {
  String topPanelText;
  bool showSeeMoreButton;
  double? topPanelTextSize;
  Widget? panelRightWidget;

  CustomCardTopPanel({
    super.key,
    required this.topPanelText,
    required this.showSeeMoreButton,
    this.topPanelTextSize = 12,
    this.panelRightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: topPanelText,
          fontSize: topPanelTextSize,
          fontWeight: FontWeight(600),
          color: Colors.black,
        ),
        showSeeMoreButton
            ? GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Zobacz więcej",
                      color: Colors.blueAccent,
                      fontWeight: FontWeight(600),
                      fontSize: 10,
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
