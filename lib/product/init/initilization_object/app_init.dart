import 'dart:async';

import 'package:architecture_template_v2/app.dart';
import 'package:architecture_template_v2/product/init/product_localization.dart';
import 'package:architecture_template_v2/product/init/state_initialize.dart';
import 'package:architecture_template_v2/product/init/usecase/product_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Initiliaze Application
class AppInit implements ProductInit {
  @override
  FutureOr<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(ProductLocalization(child: const StateInitialize(child: MyApp())));
  }
}
