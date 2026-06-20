import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/themes/extenstions/gradient_theme.dart';
import 'package:weather_app/themes/light_theme.dart';
import 'package:weather_app/utils/custom_button.dart';
import 'package:weather_app/utils/custom_dropdown/custom_dropdown.dart';
import 'package:weather_app/utils/custom_text.dart';

class LocationPickPage extends StatefulWidget {
  final Function changeLocation;
  bool closeButton;
  LocationPickPage({
    super.key,
    required this.changeLocation,
    this.closeButton = false,
  });

  @override
  State<LocationPickPage> createState() => _LocationPickPageState();
}

class _LocationPickPageState extends State<LocationPickPage> {
  GeoResponse? locationsData;
  final TextEditingController controller = TextEditingController();

  Future<void> getLocations() async {
    String inputText = controller.text.trim();
    if (inputText.length <= 2) return;

    String locationName = inputText.split(',')[0];
    String? countryCode = inputText.contains(',')
        ? inputText.split(',')[1].toUpperCase().trim()
        : null;

    try {
      GeoApi api = GeoApi();
      final response = await api.getLocations(locationName, countryCode);

      if (response != null) {
        setState(() {
          locationsData = response;
        });
      }
    } catch (e) {
      setState(() {
        locationsData = null;
      });
      debugPrint('Geo api error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors:
                Theme.of(context).extension<GradientTheme>()?.colors ??
                <Color>[],
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
            child: Column(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                // top text
                AutoSizeText(
                  "Podaj swoją Lokalizacje",
                  maxLines: 1,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 35),
                ),
                AutoSizeText(
                  "Wpisz miasto i kod kraju po przecinku",
                  maxLines: 2,
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade100,
                    fontWeight: FontWeight(150),
                    fontSize: 12,
                  ),
                ),

                // dropdown
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 25,
                    children: [
                      CustomDropdown(
                        results: locationsData?.results,
                        controller: controller,
                        onSelected: widget.changeLocation,
                      ),

                      // Search button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                            child: CustomButton(
                              onPressed: getLocations,
                              icon: Icon(Icons.search, color: Colors.white),
                              child: Text(
                                "Wyszukaj",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          if (widget.closeButton)
                            FittedBox(
                              child: CustomButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.close, color: Colors.white),
                                child: Text(
                                  "Zamknij",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
