import 'package:bloc/bloc.dart';

import '../../../services/data_source/local/object_box_service.dart';
import '../../model/theme_model.dart';

class ThemeCubit extends Cubit<bool> {
  final ObjectBoxService objectBox;

  ThemeCubit(this.objectBox) : super(false) {
    _loadTheme();
  }

  void _loadTheme() {
    final themes = objectBox.getAll<ThemeModel>();

    if (themes.isNotEmpty) {
      emit(themes.first.isDark);
    } else {
      final theme = ThemeModel(isDark: false);
      objectBox.put(theme); // ID = 0 → ObjectBox assigns it
      emit(false);
    }
  }

  void toggleTheme() {
    final newTheme = !state;
    final themes = objectBox.getAll<ThemeModel>();

    if (themes.isNotEmpty) {
      final updated = themes.first..isDark = newTheme;
      objectBox.put(updated); // Updates the same ID
    } else {
      objectBox.put(ThemeModel(isDark: newTheme));
    }

    emit(newTheme);
  }
}
