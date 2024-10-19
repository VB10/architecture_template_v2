// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeDetailView]
class HomeDetailRoute extends PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDetailRouteArgs>();
      return HomeDetailView(
        id: args.id,
        key: args.key,
      );
    },
  );
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}
