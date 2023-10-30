import 'dart:async';

import 'package:architecture_template_v2/product/init/usecase/product_init.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Initiliaze Logger
class LoggerInit implements ProductInit {
  @override
  FutureOr<void> init() async {
    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// TODO : add custom logger
      Logger().e(details.exceptionAsString());
    };
  }
}
