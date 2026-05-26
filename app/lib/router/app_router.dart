import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/filme_item.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TelaPrincipalRoute.page, initial: true),
    AutoRoute(page: DetalhesFilmeRoute.page),
  ];
}