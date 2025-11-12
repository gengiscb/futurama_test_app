import 'dart:convert';

import 'package:futurama_api/futurama_api.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when fetchCharacters fails.
class FetchCharactersRequestFailure implements Exception {}

// Exception thrown when fetchCharacter fails.
class FetchCharacterRequestFailure implements Exception {}

class FuturamaApiClient {
  FuturamaApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'futuramaapi.com';

  final http.Client _httpClient;

  /// Fetchs a [List<Character>] `/api/characters?orderBy=id&orderByDirection=asc&page=$page&size=$size`.
  Future<List<Character>> fetchCharacters({
    required int page,
    required int size,
  }) async {
    final charactersRequest = Uri.https(
      _baseUrl,
      'api/characters',
      <String, String>{
        'orderBy': 'id',
        'orderByDirection': 'asc',
        'page': '$page',
        'size': '$size',
      },
    );

    final fetchCharactersResponse = await _httpClient.get(charactersRequest);

    if (fetchCharactersResponse.statusCode != 200) {
      throw FetchCharactersRequestFailure();
    }
    final fetchCharactersJson = jsonDecode(fetchCharactersResponse.body) as Map;

    final items = fetchCharactersJson['items'] as List;

    return items.map((dynamic result) {
      final json = result as Map<String, dynamic>;
      return Character.fromJson(json);
    }).toList();
  }

  /// Fetchs a [Character] `/api/characters?orderBy=id&orderByDirection=asc&page=$page&size=$size`.
  Future<Character> fetchCharacter({required int id}) async {
    final characterRequest = Uri.https(_baseUrl, 'api/characters/$id');

    final fetchCharacterResponse = await _httpClient.get(characterRequest);

    if (fetchCharacterResponse.statusCode != 200) {
      throw FetchCharacterRequestFailure();
    }
    final fetchCharactersJson = jsonDecode(fetchCharacterResponse.body);
    return Character.fromJson(fetchCharactersJson);
  }

  /// Closes the underlying http client.
  void close() {
    _httpClient.close();
  }
}
