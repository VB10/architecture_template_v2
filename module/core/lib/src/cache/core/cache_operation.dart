import 'package:core/src/cache/core/cache_model.dart';

/// The CacheOperation class is an abstract class that defines the operations
/// that can be performed on a cache.
abstract class CacheOperation<T extends CacheModel> {
  /// Initialize cache operation
  const CacheOperation();

  /// Add a item to cache
  void add(T item);

  /// Add all items to cache
  void addAll(List<T> items);

  /// Remove a item from cache
  void clear();

  /// Get all items from cache
  List<T> getAll();

  /// Get a item from cache
  T? get(String id);
}
