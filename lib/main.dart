import 'package:flutter/material.dart';
import 'package:kolepto/provider/navigation_state.dart';
import 'package:kolepto/screens/main%20screens/generator_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kolepto',
      theme: ThemeData(),
      home: const GeneratorPage(
        selectedIndex: 0,
      ),
    );
  }
}
