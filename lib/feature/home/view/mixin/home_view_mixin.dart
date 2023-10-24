import 'package:architecture_template_v2/feature/home/view/home_view.dart';
import 'package:architecture_template_v2/product/service/login_service.dart';
import 'package:architecture_template_v2/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template_v2/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';

/// Manage your home view business logic
mixin HomeViewMixin on State<HomeView> {
  late final LoginService loginService;
  late final ProductNetworkErrorManager productNetworkErrorManager;
  @override
  void initState() {
    super.initState();
    loginService = LoginService(ProductStateItems.productNetworkManager);
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
  }
}
