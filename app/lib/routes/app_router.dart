import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/filme_item.dart';
import '../screens/detalhes_filme_screen.dart';
import '../screens/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: TelaPrincipalMovieRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: DetalhesFilmeRoute.page,
        ),
      ];
}