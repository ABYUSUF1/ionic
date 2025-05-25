import 'package:bloc/bloc.dart';
import 'package:ionic/core/services/data_source/local/local_app_settings_service.dart';

class ThemeCubit extends Cubit<bool> {
  final LocalAppSettingsService localAppSettingsService;

  ThemeCubit(this.localAppSettingsService)
    : super(localAppSettingsService.settings.isDarkMode);

  void toggleTheme() {
    final current = localAppSettingsService.settings;
    current.isDarkMode = !current.isDarkMode;
    localAppSettingsService.updateIsDarkMode(current.isDarkMode);
    emit(current.isDarkMode);
  }
}
