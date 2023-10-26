import 'package:core/src/cache/core/cache_model.dart';
import 'package:core/src/cache/core/cache_operation.dart';
import 'package:hive/hive.dart';

/// The HiveCacheOperation class is an
/// implementation of the CacheOperation class.
class HiveCacheOperation<T extends CacheModel> extends CacheOperation<T> {
  /// Initialize hive box
  HiveCacheOperation() {
    _box = Hive.box<T>(name: T.toString());
  }
  late final Box<T> _box;
  @override
  void add(T item) {
    _box.put(item.id, item);
  }

  @override
  void addAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }

  @override
  void clear() {
    _box.clear();
  }

  @override
  T? get(String id) {
    return _box.get(id);
  }

  @override
  List<T> getAll() {
    return _box
        .getAll(_box.keys)
        .where((element) => element != null)
        .cast<T>()
        .toList();
  }

  @override
  void remove(String id) {
    _box.delete(id);
  }
}
