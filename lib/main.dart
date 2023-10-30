import 'dart:async';

import 'package:architecture_template_v2/product/init/adapter_initiliazer.dart';
import 'package:logger/logger.dart';

FutureOr<void> main({bool testMode = false}) async =>
    runZonedGuarded(() => AdapterInitializer(testMode: testMode).init(),
        (error, stack) {
      Logger().e(error);
      // TODO Firebase Crashlytics
      //  FirebaseCrashlytics.instance.recordError(error, stack));
    });
