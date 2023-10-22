import 'package:architecture_template_v2/product/widget/button/normal_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'custom_login_button_mixin.dart';

final class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({required this.onOperation, super.key});
  final AsyncValueGetter<bool> onOperation;
  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton>
    with MountedMixin, _CustomLoginButtonMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        if (value) return const SizedBox();
        return NormalButton(
          title: 'Login',
          onPressed: () async {
            await _onPressed(context);
          },
        );
      },
    );
  }
}
