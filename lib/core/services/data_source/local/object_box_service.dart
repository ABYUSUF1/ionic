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

  /// Close the store when no longer needed
  void close() => store.close();

  /// Get the box for type T
  Box<T> box<T>() => store.box<T>();

  /// Insert or update a single object
  void put<T>(T object) => box<T>().put(object);

  /// Insert or update a list of objects
  void putMany<T>(List<T> objects) => box<T>().putMany(objects);

  /// Get object by ID
  T? get<T>(int id) => box<T>().get(id);

  /// Get all objects of type T
  List<T> getAll<T>() => box<T>().getAll();

  /// Remove an object by ID
  bool remove<T>(int id) => box<T>().remove(id);

  /// Remove all objects of type T
  int removeAll<T>() => box<T>().removeAll();

  /// Count of all objects in the box
  int count<T>() => box<T>().count();

  /// Check if box is empty
  bool isEmpty<T>() => box<T>().isEmpty();

  /// Generic query method using a condition
  List<T> query<T>(Condition<T> condition) {
    final query = box<T>().query(condition).build();
    final results = query.find();
    query.close();
    return results;
  }
}
