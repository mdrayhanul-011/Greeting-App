import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Greeting App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Hello, World!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Flutter!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/FlutterLogo.png',
                width: 140,
                height: 140,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button Pressed!')),
                  );
                },
                child: const Text('Press Me'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
