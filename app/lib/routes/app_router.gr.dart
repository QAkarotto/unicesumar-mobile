// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetalhesFilmeRoute.name: (routeData) {
      final args = routeData.argsAs<DetalhesFilmeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetalhesFilmeScreen(
          key: args.key,
          filme: args.filme,
        ),
      );
    },
    TelaPrincipalMovieRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TelaPrincipalMovieScreen(),
      );
    },
  };
}

/// generated route for
/// [DetalhesFilmeScreen]
class DetalhesFilmeRoute extends PageRouteInfo<DetalhesFilmeRouteArgs> {
  DetalhesFilmeRoute({
    Key? key,
    required FilmeItem filme,
    List<PageRouteInfo>? children,
  }) : super(
          DetalhesFilmeRoute.name,
          args: DetalhesFilmeRouteArgs(
            key: key,
            filme: filme,
          ),
          initialChildren: children,
        );

  static const String name = 'DetalhesFilmeRoute';

  static const PageInfo<DetalhesFilmeRouteArgs> page =
      PageInfo<DetalhesFilmeRouteArgs>(name);
}

class DetalhesFilmeRouteArgs {
  const DetalhesFilmeRouteArgs({
    this.key,
    required this.filme,
  });

  final Key? key;

  final FilmeItem filme;

  @override
  String toString() {
    return 'DetalhesFilmeRouteArgs{key: $key, filme: $filme}';
  }
}

/// generated route for
/// [TelaPrincipalMovieScreen]
class TelaPrincipalMovieRoute extends PageRouteInfo<void> {
  const TelaPrincipalMovieRoute({List<PageRouteInfo>? children})
      : super(
          TelaPrincipalMovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'TelaPrincipalMovieRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
