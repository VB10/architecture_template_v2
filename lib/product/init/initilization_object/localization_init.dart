import 'dart:async';

import 'package:architecture_template_v2/product/init/usecase/product_init.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';

/// Initiliaze Localization
class LocalizationInit implements ProductInit {
  @override
  FutureOr<void> init() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
  }
}
