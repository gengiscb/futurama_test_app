// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  gender: json['gender'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  image: json['image'] as String? ?? '',
);

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'gender': instance.gender,
  'status': instance.status,
  'species': instance.species,
  'createdAt': instance.createdAt.toIso8601String(),
  'image': instance.image,
};
