import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({required this.user});
  UserCacheModel.empty() : user = User();
  final User user;

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null');
      return this;
    }
    return copyWith(
      user: User.fromJson(jsonMap),
    );
  }

  @override
  String get id => user.id.toString();

  @override
  Map<String, dynamic> toJson() {
    return user.toJson();
  }

  UserCacheModel copyWith({
    User? user,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
    );
  }
}
