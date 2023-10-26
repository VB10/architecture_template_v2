import 'package:architecture_template_v2/feature/home/view/mixin/home_view_mixin.dart';
import 'package:architecture_template_v2/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template_v2/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template_v2/product/state/base/base_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            productViewModel.changeThemeMode(ThemeMode.dark);
            await homeViewModel.fetchUsers();
          },
        ),
        appBar: const _HomeAppBar(),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _UserList(),
            ),
          ],
        ),
      ),
    );
  }
}

final class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();

          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final user = state[index];
              return ListTile(
                title: Text(user.userId.toString()),
                // todo: trailing: Text(user.title ?? ''),
                trailing: Text(user.body?[0] ?? ''),
                subtitle: Text(user.body.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
