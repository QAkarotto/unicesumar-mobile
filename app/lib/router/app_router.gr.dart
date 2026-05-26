// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DetalhesFilmeScreen]
class DetalhesFilmeRoute extends PageRouteInfo<DetalhesFilmeRouteArgs> {
  DetalhesFilmeRoute({
    Key? key,
    required FilmeItem filme,
    List<PageRouteInfo>? children,
  }) : super(
         DetalhesFilmeRoute.name,
         args: DetalhesFilmeRouteArgs(key: key, filme: filme),
         initialChildren: children,
       );

  static const String name = 'DetalhesFilmeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetalhesFilmeRouteArgs>();
      return DetalhesFilmeScreen(key: args.key, filme: args.filme);
    },
  );
}

class DetalhesFilmeRouteArgs {
  const DetalhesFilmeRouteArgs({this.key, required this.filme});

  final Key? key;

  final FilmeItem filme;

  @override
  String toString() {
    return 'DetalhesFilmeRouteArgs{key: $key, filme: $filme}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetalhesFilmeRouteArgs) return false;
    return key == other.key && filme == other.filme;
  }

  @override
  int get hashCode => key.hashCode ^ filme.hashCode;
}

/// generated route for
/// [TelaPrincipalMovieApp]
class TelaPrincipalRoute extends PageRouteInfo<void> {
  const TelaPrincipalRoute({List<PageRouteInfo>? children})
    : super(TelaPrincipalRoute.name, initialChildren: children);

  static const String name = 'TelaPrincipalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TelaPrincipalMovieApp();
    },
  );
}
