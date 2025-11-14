// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStore, Store {
  Computed<ObservableList<Character>>? _$filteredCharactersComputed;

  @override
  ObservableList<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<ObservableList<Character>>(
        () => super.filteredCharacters,
        name: '_CharactersStore.filteredCharacters',
      )).value;

  late final _$itemsAtom = Atom(
    name: '_CharactersStore.items',
    context: context,
  );

  @override
  ObservableList<Character> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Character> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$pageAtom = Atom(name: '_CharactersStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$hasReachedMaxAtom = Atom(
    name: '_CharactersStore.hasReachedMax',
    context: context,
  );

  @override
  bool get hasReachedMax {
    _$hasReachedMaxAtom.reportRead();
    return super.hasReachedMax;
  }

  @override
  set hasReachedMax(bool value) {
    _$hasReachedMaxAtom.reportWrite(value, super.hasReachedMax, () {
      super.hasReachedMax = value;
    });
  }

  late final _$statusAtom = Atom(
    name: '_CharactersStore.status',
    context: context,
  );

  @override
  StoreStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StoreStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_CharactersStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$filterAtom = Atom(
    name: '_CharactersStore.filter',
    context: context,
  );

  @override
  GenderFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(GenderFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$fetchAsyncAction = AsyncAction(
    '_CharactersStore.fetch',
    context: context,
  );

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
items: ${items},
page: ${page},
hasReachedMax: ${hasReachedMax},
status: ${status},
errorMessage: ${errorMessage},
filter: ${filter},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
