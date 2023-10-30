import 'dart:async';

abstract class ProductInit {
  const ProductInit._();
  FutureOr<void> init() async {}
}
