import 'package:flutter/material.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/pages/location_pick_page.dart';
import 'package:weather_app/utils/custom_text.dart';
import 'package:weather_app/utils/translations.dart';

class AppBarLocationIndicator extends StatelessWidget {
  final GeoResult? placeData;
  final Function changeLocation;

  AppBarLocationIndicator({
    super.key,
    required this.placeData,
    required this.changeLocation,
  });

  @override
  Widget build(BuildContext context) {
    void closePopupAndChangeLocation(GeoResult result) {
      changeLocation(result);
      Navigator.pop(context);
    }

    void showLocationSearchDialog() {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) {
          return LocationPickPage(
            changeLocation: closePopupAndChangeLocation,
            closeButton: true,
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutSine,
            reverseCurve: Curves.easeInSine,
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          );
        },
      );
    }

    return GestureDetector(
      onTap: showLocationSearchDialog,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(Icons.location_pin, size: 18),
              CustomText(
                text:
                    placeData?.name ??
                    translations[SupportedLanguage.pl]!['select_location'],
                fontSize: 20,
              ),
              Icon(Icons.arrow_drop_down, size: 25),
            ],
          ),
          CustomText(text: placeData?.admin1 ?? "", fontSize: 12),
        ],
      ),
    );
  }
}
