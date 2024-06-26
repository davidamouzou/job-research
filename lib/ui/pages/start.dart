import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/utils/routes/routes_name.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<double> progresses = [0.0, 0.0, 0.0];

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
                children:
                    List.generate(3, (index) => _buildProgressIndicator(index)),
              ),
              const SizedBox(height: 16.0),
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(
                    "assets/images/${Theme.of(context).brightness == Brightness.dark ? "dark.png" : "light.png"}"),
              ),
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

  Widget _buildProgressIndicator(int index) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              for (int i = 0; i < progresses.length; i++) {
                progresses[i] = i < index ? 1.0 : 0.0;
              }
            });
          },
          child: LinearProgressIndicator(
            value: progresses[index],
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).textTheme.bodyLarge?.color,
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
            for (int i = 0; i < progresses.length; i++) {
              if (progresses[i] < 1.0 && (i == 0 || progresses[i - 1] >= 1.0)) {
                progresses[i] += 0.01;
                break;
              }
            }
          });
        }
      },
    );
  }
}
