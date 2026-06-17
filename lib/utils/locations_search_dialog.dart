import 'package:flutter/material.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/utils/custom_dropdown/custom_dropdown.dart';

class LocationSearchDialog extends StatefulWidget {
  final Function onSelected;
  const LocationSearchDialog({super.key, required this.onSelected});

  @override
  State<LocationSearchDialog> createState() => _LocationSearchDialogState();
}

class _LocationSearchDialogState extends State<LocationSearchDialog> {
  GeoResponse? locationsData;
  final TextEditingController controller = TextEditingController();

  Future<void> getLocations() async {
    String inputText = controller.text.trim();
    if (inputText.length <= 2) return;

    String locationName = inputText.split(',')[0];
    String? countryCode = inputText.contains(',')
        ? inputText.split(',')[1].toUpperCase()
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
      debugPrint('Geo api error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Upiększ
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        child: SizedBox(
          height: locationsData != null ? 325 : 140,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              children: [
                CustomDropdown(
                  results: locationsData?.results,
                  onSelected: widget.onSelected,
                  controller: controller,
                ),
                IconButton(
                  onPressed: getLocations,
                  icon: Icon(Icons.search, size: 20, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
