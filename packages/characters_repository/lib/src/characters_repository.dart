import 'package:futurama_api/futurama_api.dart';

class CharactersRepository {
  CharactersRepository({FuturamaApiClient? futuramaApiClient})
    : _futuramaApiClient = futuramaApiClient ?? FuturamaApiClient();

  final FuturamaApiClient _futuramaApiClient;

  Future<List<Character>> fetchCharacters({
    required int page,
    required int size,
  }) async {
    final characters = await _futuramaApiClient.fetchCharacters(
      page: page,
      size: size,
    );

    return characters;
  }

  Future<Character> fetchCharacter({required int id}) async {
    final character = await _futuramaApiClient.fetchCharacter(id: id);
    return character;
  }

  void dispose() => _futuramaApiClient.close();
}
