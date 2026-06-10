import 'package:flutter/material.dart';
import 'package:weather_app/utils/custom_text.dart';

class CustomCardTopPanel extends StatelessWidget {
  String topPanelText;
  bool showSeeMoreButton;
  CustomCardTopPanel({
    super.key,
    required this.topPanelText,
    required this.showSeeMoreButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: topPanelText,
          fontSize: 12,
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
      ],
    );
  }
}
