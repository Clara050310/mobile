import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo Scaffold"),
        ),
        body: Center(
          child: Text("Texto do Scaffold"),
        ),
      ),
    );
  }
}
