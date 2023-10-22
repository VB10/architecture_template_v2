import 'package:architecture_template_v2/product/widget/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class DialogNormalButton extends StatelessWidget {
  const DialogNormalButton({required this.onComplete, super.key});
  final ValueChanged<bool> onComplete;
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      title: 'Dialog Normal Button',
      onPressed: () async {
        final response =
            await SuccessDialog.show(title: 'title', context: context);
        onComplete.call(response);
      },
    );
  }
}
