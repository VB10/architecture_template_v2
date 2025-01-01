import 'package:architecture_template_v2/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// HomeUserList widget
final class HomeUserList extends StatelessWidget {
  const HomeUserList({required this.users, super.key});
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          onTap: () {
            context.router.push(HomeDetailRoute(id: user.userId.toString()));
          },
          title: Text(user.userId.toString()),
          trailing: Text(user.body?[0] ?? ''),
          subtitle: Text(user.body.toString()),
        );
      },
    );
  }
}
