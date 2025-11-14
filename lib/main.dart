import 'package:flutter/material.dart';
import 'package:futurama_test_app/characters/characters.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<CharactersStore>(create: (_) => CharactersStore())],
      child: MaterialApp(
        title: 'Futurama Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: const CharactersPage(),
      ),
    );
  }
}
