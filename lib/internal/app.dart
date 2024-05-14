import 'package:flutter/material.dart';
import 'package:pixela/presentation/homePage/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pixela",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Material(
        child: HomePage(),
      ),
    );
  }
}
