import 'package:characters_repository/characters_repository.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

enum StoreStatus { initial, loading, success, failure }

// ignore: library_private_types_in_public_api
class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final _characterRepo = CharactersRepository();

  final int pageSize = 50;

  @observable
  ObservableList<Character> items = ObservableList<Character>();

  @observable
  int page = 1;

  @observable
  bool hasReachedMax = false;

  @observable
  StoreStatus status = StoreStatus.initial;

  @observable
  String? errorMessage;

  @action
  Future<void> fetch() async {
    print('fetch page $page');
    if (hasReachedMax) return;

    try {
      errorMessage = null;
      if (status == StoreStatus.initial) {
        status = StoreStatus.loading;
      }

      final nextPage = status == StoreStatus.initial ? 1 : page;
      final fetchChars = await _characterRepo.fetchCharacters(
        page: nextPage,
        size: pageSize,
      );
      if (fetchChars.isEmpty) {
        hasReachedMax = true;
      } else {
        items.addAll(fetchChars);
      }
      page = page + 1;
      status = StoreStatus.success;
    } catch (e) {
      status = StoreStatus.failure;
      errorMessage = e.toString();
    }
  }

  void dispose() {
    _characterRepo.dispose();
  }
}
