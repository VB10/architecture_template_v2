import 'package:architecture_template_v2/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template_v2/product/service/interface/authenction_operation.dart';
import 'package:architecture_template_v2/product/state/base/base_cubit.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState> {
  /// [AuthenticationOperation] service
  HomeViewModel({required AuthenticationOperation operationService})
      : _authenticationOperationService = operationService,
        super(const HomeState(isLoading: false));

  late final AuthenticationOperation _authenticationOperationService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get users
  Future<void> fetchUsers() async {
    final response = await _authenticationOperationService.users();
    emit(state.copyWith(users: response));
  }
}
