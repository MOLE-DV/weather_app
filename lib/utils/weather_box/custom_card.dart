import 'package:flutter/material.dart';
import 'package:weather_app/utils/weather_box/custom_card_top_panel.dart';

class CustomCard extends StatelessWidget {
  final String topPanelText;
  final bool showSeeMoreButton;
  Widget child;
  Widget? panelRightWidget;

  CustomCard({
    super.key,
    required this.topPanelText,
    required this.showSeeMoreButton,
    required this.child,
    this.panelRightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
