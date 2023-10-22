part of 'custom_login_button.dart';

mixin _CustomLoginButtonMixin
    on MountedMixin<CustomLoginButton>, State<CustomLoginButton> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier.value = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onPressed(BuildContext context) async {
    _isLoadingNotifier.value = true;
    final response = await widget.onOperation.call();
    await safeOperation(() async {
      if (response) Navigator.of(context).pop();
      _isLoadingNotifier.value = false;
    });
  }
}
