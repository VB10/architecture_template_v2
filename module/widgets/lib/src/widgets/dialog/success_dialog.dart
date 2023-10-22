import 'package:flutter/material.dart';
import 'package:widgets/src/core/dialog_base.dart';

/// Show a dialog for success
final class SuccessDialog extends StatelessWidget {
  /// Constructor for dialog
  const SuccessDialog({required this.title, super.key});

  /// Title for the dialog
  final String title;

  /// Show the dialog for success
  /// This will always return [true]
  static Future<bool> show({
    required String title,
    required BuildContext context,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => SuccessDialog(title: title),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
