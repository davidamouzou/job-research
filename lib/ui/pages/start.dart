import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/routes/routes_name.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  double progress1 = 0.0;
  double progress2 = 0.0;
  double progress3 = 0.0;

  @override
  void initState() {
    super.initState();
    _updateProgress();
  }

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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            progress1 = 0.0;
                            progress2 = 0.0;
                            progress3 = 0.0;
                          });
                        },
                        child: LinearProgressIndicator(
                          value: progress1,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            progress1 = 1.0;
                            progress2 = 0.0;
                            progress3 = 0.0;
                          });
                        },
                        child: LinearProgressIndicator(
                          value: progress2,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            progress1 = 1.0;
                            progress2 = 1.0;
                            progress3 = 0.0;
                          });
                        },
                        child: LinearProgressIndicator(
                          value: progress3,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
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
    // Navigate to search page
    context.pushNamed(AppRoutesName.search.name);
  }

  void _updateProgress() {
    // update progress
    Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (mounted) {
          setState(() {
            if (progress1 < 1.0) {
              progress1 += 0.01;
            }
            if (progress2 < 1.0 && progress1 >= 1.0) {
              progress2 += 0.01;
            }
            if (progress3 < 1.0 && progress2 >= 1.0) {
              progress3 += 0.01;
            }
          });
        }
      },
    );
  }
}
