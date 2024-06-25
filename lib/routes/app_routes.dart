import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/data/profile_model.dart';
import 'package:myapp/ui/pages/home.dart';
import 'package:myapp/ui/pages/profile_view.dart';
import 'package:myapp/ui/pages/search.dart';
import 'package:myapp/ui/pages/start.dart';
import 'package:myapp/routes/routes_name.dart';

GoRouter appRouteConfig = GoRouter(
  initialLocation: '/start',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: '/search',
          name: AppRoutesName.search.name,
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/',
          name: AppRoutesName.home.name,
          builder: (context, state) => const Scaffold(),
        ),
      ],
    ),
    GoRoute(
      path: '/start',
      name: AppRoutesName.start.name,
      builder: (context, state) => const StartPage(),
    ),
     GoRoute(
      path: '/profile_view',
      name: AppRoutesName.profileView.name,
      builder: (context, state) => ProfileView(profile: state.extra as Profile,),
    ),
  ],
);
