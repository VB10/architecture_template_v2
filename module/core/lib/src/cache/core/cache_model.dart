mixin CacheModel {
  String get id;

  CacheModel fromDynamicJson(dynamic json);
  Map<String, dynamic> toJson();
}
