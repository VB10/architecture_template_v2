import 'dart:async';

import 'package:architecture_template_v2/product/init/config/app_environment.dart';
import 'package:architecture_template_v2/product/state/container/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // TODO: Splash
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    _productEnvironmentWithContainer();

    await ProductStateItems.productCache.init();
    // Depedency initialize
    // envied
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.general();

    /// It must be call after [AppEnvironment.general()]
    ProductContainer.setup();
  }
}
