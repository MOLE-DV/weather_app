import 'package:flutter/material.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/utils/custom_text.dart';

class CustomDropdownItem extends StatelessWidget {
  final GeoResult placeData;
  final Function onSelected;
  final ButtonStyle? buttonStyle;
  const CustomDropdownItem({
    super.key,
    required this.placeData,
    required this.onSelected,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ElevatedButton(
        onPressed: () => onSelected(placeData),
        style: buttonStyle,
        child: Container(
          height: 25,
          alignment: Alignment.center,
          child: CustomText(
            text: '${placeData.name} ${placeData.admin1} ${placeData.country}',
            fontWeight: FontWeight(300),
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
