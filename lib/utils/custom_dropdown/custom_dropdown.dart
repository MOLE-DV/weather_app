import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/api/geo_api.dart';
import 'package:weather_app/utils/custom_dropdown/custom_dropdown_item.dart';

class CustomDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<GeoResult>? results;
  final Function onSelected;
  final Color? iconColor;
  final double? iconSize;
  final double? width;
  final double? height;
  final InputDecoration? inputDecoration;
  final ButtonStyle? resultButtonStyle;

  const CustomDropdown({
    super.key,
    required this.results,
    required this.controller,
    required this.onSelected,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    this.inputDecoration,
    this.resultButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    double dropdownHeight = 70;
    if (results != null && results!.isNotEmpty) {
      dropdownHeight = 250;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: dropdownHeight,
          child: Column(
            spacing: 5,
            children: [
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight(300),
                      ),

                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_pin,
                          size: 20,
                          color: Colors.white,
                        ),
                        hintText: "np. Warsaw, PL",
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: results != null
                    ? ListView(
                        children: results!
                            .map(
                              (GeoResult result) => CustomDropdownItem(
                                buttonStyle:
                                    resultButtonStyle ??
                                    ButtonStyle(
                                      shape: WidgetStateProperty.all(
                                        (RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.white24,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        )),
                                      ),
                                      elevation: WidgetStateProperty.all((0)),
                                      backgroundColor:
                                          WidgetStateProperty.resolveWith<
                                            Color
                                          >((states) {
                                            if (states.contains(
                                              WidgetState.hovered,
                                            )) {
                                              return Colors.grey.shade300
                                                  .withAlpha(40);
                                            }
                                            return Colors.grey.shade300
                                                .withAlpha(50);
                                          }),
                                    ),
                                placeData: result,
                                onSelected: onSelected,
                              ),
                            )
                            .toList(),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
