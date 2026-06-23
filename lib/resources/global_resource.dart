import 'package:flutter/material.dart';
import 'package:weather_app/hive/app_settings_adapter.dart';
import 'package:weather_app/utils/translations/app_translation.dart';

class GlobalResource extends InheritedWidget {
  final AppSettings appSettings;
  final AppTranslation appTranslation;
  final Function(AppSettings) changeSettings;
  final Function(AppTranslation) changeTranslation;

  const GlobalResource({
    super.key,
    required this.appSettings,
    required this.appTranslation,
    required this.changeSettings,
    required this.changeTranslation,
    required super.child,
  });

  static GlobalResource of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalResource>()!;
  }

  @override
  bool updateShouldNotify(GlobalResource oldWidget) {
    return oldWidget.appSettings != appSettings ||
        oldWidget.appTranslation != appTranslation;
  }
}
