import 'package:architecture_template_v2/feature/home/view/home_detail_view.dart';
import 'package:architecture_template_v2/feature/home/view/widget/home_user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

void main() {
  setUp(() {});
  testWidgets('Home User List Test', (tester) async {
    final users = [
      User(userId: 1, body: 'body 1'),
      User(userId: 2, body: 'body 2'),
      User(userId: 3, body: 'body 3'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      context.route
                          .navigateToPage(const HomeDetailView(id: 'id'));
                    },
                    icon: const Icon(Icons.details),
                  );
                },
              ),
            ],
          ),
          body: HomeUserList(users: users),
        ),
      ),
    );

    for (final item in users) {
      expect(find.text(item.userId.toString()), findsOneWidget);
    }

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(find.text('Home Detail View'), findsOneWidget);
  });
}
