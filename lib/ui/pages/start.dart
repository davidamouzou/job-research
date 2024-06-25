import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/routes/routes_name.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: LinearProgressIndicator(
                          value: i / 3,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16.0),
              Image.asset(
                  "assets/images/${Theme.of(context).brightness == Brightness.dark ? "dark.png" : "light.png"}"),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Text(
                      "Where skills meet opportunity",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Find a specialist")),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: _goHome, child: const Text("Find job")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goHome() {
    context.pushNamed(AppRoutesName.search.name);
  }
}
