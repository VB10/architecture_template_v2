// example/integration_test/example_test.dart
import 'package:architecture_template_v2/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'Open home page and press button',
    ($) async {
      await app.main();
      await $.pumpAndSettle();
      await $(FloatingActionButton).tap();
      await $.pumpAndSettle();
      await $('1').waitUntilVisible();
      $(Scrollable).containing(Text);
      expect($('q'), findsWidgets);
    },
  );
}
