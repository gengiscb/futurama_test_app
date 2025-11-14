import 'package:characters_repository/characters_repository.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

enum StoreStatus { initial, loading, success, failure }

enum GenderFilter { all, male, female }

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

  @observable
  GenderFilter filter = GenderFilter.all;

  @computed
  ObservableList<Character> get maleCharacters =>
      ObservableList.of(items.where((c) => c.gender == 'MALE'));

  @computed
  ObservableList<Character> get femaleCharacters =>
      ObservableList.of(items.where((c) => c.gender == 'FEMALE'));

  @computed
  ObservableList<Character> get filteredCharacters {
    switch (filter) {
      case GenderFilter.male:
        return maleCharacters;
      case GenderFilter.female:
        return femaleCharacters;
      default:
        return items;
    }
  }

  @action
  Future<void> fetch() async {
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

  void setGenderFilter(GenderFilter newFilter) {
    filter = newFilter;
  }

  void dispose() {
    _characterRepo.dispose();
  }
}
