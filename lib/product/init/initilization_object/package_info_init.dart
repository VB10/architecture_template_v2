import 'dart:async';

import 'package:architecture_template_v2/product/init/config/app_environment.dart';
import 'package:architecture_template_v2/product/init/usecase/product_init.dart';
import 'package:architecture_template_v2/product/state/container/index.dart';
import 'package:kartal/kartal.dart';

/// Initiliaze Package Info
class PackageInfoInit implements ProductInit {
  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.general();

    /// It must be call after [AppEnvironment.general()]
    ProductContainer.setup();
  }

  @override
  FutureOr<void> init() async {
    await DeviceUtility.instance.initPackageInfo();

    _productEnvironmentWithContainer();

    await ProductStateItems.productCache.init();
  }
}
