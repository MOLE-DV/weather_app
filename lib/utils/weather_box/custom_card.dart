import 'package:flutter/material.dart';
import 'package:weather_app/utils/weather_box/custom_card_top_panel.dart';

class CustomCard extends StatelessWidget {
  final String topPanelText;
  final bool showSeeMoreButton;
  Widget child;
  double? topPanelTextSize;
  Widget? panelRightWidget;

  CustomCard({
    super.key,
    required this.topPanelText,
    required this.showSeeMoreButton,
    required this.child,
    this.topPanelTextSize = 12,
    this.panelRightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: 20,
        ),
        child: Column(
          children: [
            // top panel
            topPanelText.isNotEmpty
                ? CustomCardTopPanel(
                    topPanelText: topPanelText,
                    showSeeMoreButton: showSeeMoreButton,
                    topPanelTextSize: topPanelTextSize,
                    panelRightWidget: panelRightWidget,
                  )
                : SizedBox.shrink(),
            // box content
            Padding(padding: EdgeInsetsGeometry.only(top: 10), child: child),
          ],
        ),
      ),
    );
  }
}
