import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/filme_item.dart';

part 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class Routes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TelaPrincipalRoute.page,
      initial: true,
    ),

    AutoRoute(
      page: DetalhesFilmeRoute.page,
    ),
  ];
}