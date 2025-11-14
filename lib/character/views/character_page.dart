import 'package:characters_repository/characters_repository.dart';
import 'package:flutter/material.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              Center(
                child: character.image.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: Image.network(character.image),
                      )
                    : Icon(Icons.error),
              ),
              SizedBox(height: 16),
              Text(
                'Status : ${character.status}',
                style: textTheme.titleMedium,
              ),

              Text(
                'Species : ${character.species}',
                style: textTheme.titleMedium,
              ),
              Text(
                'Gender : ${character.gender}',
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
