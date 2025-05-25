import 'package:ionic/core/models/app_settings.dart';

import 'object_box_service.dart';

class LocalAppSettingsService {
  final ObjectBoxService _objectBoxService;

  LocalAppSettingsService(this._objectBoxService);

  AppSettings get settings {
    final all = _objectBoxService.box<AppSettings>().getAll();
    if (all.isEmpty) {
      final defaultSettings = AppSettings(
        isFirstTime: true,
        isDarkMode: false,
        isEnableNotification: true,
      );
      _objectBoxService.box<AppSettings>().put(defaultSettings);
      return defaultSettings;
    }
    return all.first;
  }

  void updateIsDarkMode(bool value) {
    final current = settings;
    current.isDarkMode = value;
    _objectBoxService.box<AppSettings>().put(current);
  }

  void updateIsFirstTime(bool value) {
    final current = settings;
    current.isFirstTime = value;
    _objectBoxService.box<AppSettings>().put(current);
  }

  void updateNotifications(bool value) {
    final current = settings;
    current.isEnableNotification = value;
    _objectBoxService.box<AppSettings>().put(current);
  }
}
