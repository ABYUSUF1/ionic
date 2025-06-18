import 'dart:io';

import 'package:path_provider/path_provider.dart';
import '../../../../objectbox.g.dart';

class ObjectBoxService {
  late final Store store;

  ObjectBoxService._(this.store);

  /// Initialize and return an instance of ObjectBoxService
  static Future<ObjectBoxService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: dir.path);
    return ObjectBoxService._(store);
  }

  /// Delete only the ObjectBox database directory
  Future<void> deleteAllData() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbDir = Directory('${dir.path}/objectbox');
    if (await dbDir.exists()) {
      await dbDir.delete(recursive: true);
    }
  }

  /// Close the store when no longer needed
  void close() => store.close();

  /// Get the box for type T
  Box<T> box<T>() => store.box<T>();

  /// Generic query method using a condition
  List<T> query<T>(Condition<T> condition) {
    final query = box<T>().query(condition).build();
    final results = query.find();
    query.close();
    return results;
  }
}
