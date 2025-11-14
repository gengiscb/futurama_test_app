import 'package:characters_repository/characters_repository.dart';
import 'package:flutter/material.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: character.image.isNotEmpty
              ? NetworkImage(character.image)
              : null,
          child: character.image.isEmpty ? Text('N/A') : null,
        ),
        title: Text(character.name),
        subtitle: Text('${character.gender} - ${character.status}'),
        onTap: () {},
      ),
    );
  }
}
