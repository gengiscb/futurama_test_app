import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.status,
    required this.species,
    required this.createdAt,
    required this.image,
  });

  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String gender;

  @JsonKey()
  final String status;

  @JsonKey()
  final String species;

  @JsonKey()
  final DateTime createdAt;

  @JsonKey(defaultValue: '')
  final String image;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  /// Connect the generated [_$CharacterToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object> get props {
    return [id, name, gender, status, species, createdAt, image];
  }
}
