import 'package:objectbox/objectbox.dart';

@Entity()
class AppSettings {
  int id;

  bool isDarkMode;
  bool isFirstTime; // For onboarding..
  bool isEnableNotification;

  AppSettings({
    this.id = 0,
    this.isDarkMode = false,
    this.isFirstTime = false,
    this.isEnableNotification = false,
  });
}
