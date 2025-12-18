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
      title: 'AzNavigation Example',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                AzNavigation.to(
                  context,
                  const SecondPage(),
                  transition: Transition.rightToLeft,
                );
              },
              child: const Text('Right → Left'),
            ),
            ElevatedButton(
              onPressed: () {
                AzNavigation.to(
                  context,
                  const SecondPage(),
                  transition: Transition.fade,
                );
              },
              child: const Text('Fade'),
            ),
          ],
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
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AzNavigation.back(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}
