import 'package:objectbox/objectbox.dart';

@Entity()
class ThemeModel {
  int id;

  bool isDark;

  ThemeModel({this.id = 0, required this.isDark});
}
