import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/weather_box/custom_card_top_panel.dart';

class CustomCard extends StatelessWidget {
  String? topPanelText;
  bool? showSeeMoreButton;
  Widget child;

  CustomCard({
    super.key,
    this.topPanelText = "",
    this.showSeeMoreButton = false,
    required this.child,
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
            topPanelText!.isNotEmpty
                ? CustomCardTopPanel(
                    topPanelText: topPanelText!,
                    showSeeMoreButton: true,
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
