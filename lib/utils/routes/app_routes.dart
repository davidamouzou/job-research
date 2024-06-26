import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/data/profile_model.dart';
import 'package:myapp/ui/pages/navigation_page.dart';
import 'package:myapp/ui/pages/profile_detail.dart';
import 'package:myapp/ui/pages/search.dart';
import 'package:myapp/ui/pages/start.dart';
import 'package:myapp/utils/routes/routes_name.dart';

GoRouter appRouteConfig = GoRouter(
  initialLocation: '/start',
  routes: [
    ShellRoute(
      builder: (context, state, child) => NavigationPage(child: child),
      routes: [
        GoRoute(
          path: '/search',
          name: AppRoutesName.search.name,
          builder: (context, state) => const SearchPage(),
        ),
        // home page
        GoRoute(
          path: '/',
          name: AppRoutesName.home.name,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Home')),
          ),
        ),
        // Profile page
        GoRoute(
          path: '/profile',
          name: AppRoutesName.profile.name,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Profile')),
          ),
        ),
        GoRoute(
          path: '/task',
          name: AppRoutesName.task.name,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Tasks')),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/start',
      name: AppRoutesName.start.name,
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: '/profile_detail',
      name: AppRoutesName.profileDetail.name,
      builder: (context, state) => ProfileView(
        profile: state.extra as Profile,
      ),
    ),
  ],
);
