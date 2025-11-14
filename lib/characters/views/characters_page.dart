import 'package:flutter/material.dart';
import 'package:futurama_test_app/characters/characters.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Futurama Characters')),
      body: CharactersList(),
    );
  }
}
