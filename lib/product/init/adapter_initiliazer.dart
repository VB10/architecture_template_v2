import 'dart:async';

import 'package:architecture_template_v2/product/init/initilization_object/app_init.dart';
import 'package:architecture_template_v2/product/init/initilization_object/localization_init.dart';
import 'package:architecture_template_v2/product/init/initilization_object/logger_init.dart';
import 'package:architecture_template_v2/product/init/initilization_object/package_info_init.dart';
import 'package:architecture_template_v2/product/init/usecase/product_init.dart';
import 'package:logger/logger.dart';

/// Global Test variable for use mock service or device preview when its enable.
bool isTest = false;

/// Adapter Pattern Implementation for secure init in applications
class AdapterInitializer implements ProductInit {
  /// Public Constractor for get the test mode value from main.
  AdapterInitializer({required this.testMode});

  /// Mark Variable for test mode
  final bool testMode;

  /// Keep this sequence the init objects will call by sequence
  final List<ProductInit> initializeObjects = [
    PackageInfoInit(),
    LocalizationInit(),
    LoggerInit(),
    AppInit(),
  ];
  @override
  FutureOr<void> init() async {
    Logger()
        .i('Product Running - Template By VB10/architecture_template_v2 🇹🇷');
    isTest = testMode;
    for (final objects in initializeObjects) {
      try {
        await objects.init();
        Logger().d('✅ Adapter Init succeed ${objects.runtimeType}.');
      } catch (e) {
        Logger().f(
          '❌ Adapter Init gives error at ${objects.runtimeType} \n Error: $e',
        );
      }
    }
  }
}
