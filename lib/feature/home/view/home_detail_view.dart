import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage<bool?>()
final class HomeDetailView extends StatelessWidget {
  const HomeDetailView({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Detail View'),
      ),
      body: Center(
        child: Text('Home Detail View $id'),
      ),
    );
  }
}
