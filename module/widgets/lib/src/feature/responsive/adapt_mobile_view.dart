import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

/// Adapt your view only tablet and phone
final class AdaptMobileView extends StatelessWidget {
  /// Define your custom widget for every platform
  /// mobile, tablet, desktop
  const AdaptMobileView({
    required this.phone,
    required this.tablet,
    super.key,
  });

  /// Define your custom widget for mobile
  final Widget phone;

  /// Define your custom widget for tablet
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;

    return tablet;
  }
}
