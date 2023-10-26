import 'package:architecture_template_v2/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template_v2/product/cache/model/user_cache_model.dart';
import 'package:architecture_template_v2/product/service/interface/authenction_operation.dart';
import 'package:architecture_template_v2/product/state/base/base_cubit.dart';
import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState> {
  /// [AuthenticationOperation] service
  HomeViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _authenticationOperationService = operationService,
        _userCacheOperation = userCacheOperation,
        super(const HomeState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get users
  Future<void> fetchUsers() async {
    CustomLogger.showError<User>(usersFromCache);
    final response = await _authenticationOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  /// Save users to cache
  void _saveItems(List<User> user) {
    for (final element in user) {
      _userCacheOperation.add(UserCacheModel(user: element));
    }
  }

  /// Get users from cache
  List<User> get usersFromCache =>
      _userCacheOperation.getAll().map((e) => e.user).toList();
}
