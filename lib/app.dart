import 'package:flutter/material.dart';
import 'package:myapp/utils/routes/app_routes.dart';
import 'package:myapp/utils/themes/dark.dart';
import 'package:myapp/utils/themes/light.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1140424080.
    return MaterialApp.router(
      routerConfig: appRouteConfig,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}