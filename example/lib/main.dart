import 'package:flutter/material.dart';
import 'package:az_navigation/az_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AzNavigation.navigatorKey,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Az Navigation Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AzNavigation.to(
              const SecondPage(),
              transition: Transition.rightToLeft,
            );
          },
          child: const Text('Go Next'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AzNavigation.back(),
          child: const Text('Back'),
        ),
      ),
    );
  }
}
