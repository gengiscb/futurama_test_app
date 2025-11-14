import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:futurama_test_app/characters/characters.dart';
import 'package:futurama_test_app/utils/utils.dart';
import 'package:provider/provider.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  late final ScrollController _scrollController;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(const Duration(milliseconds: 300));
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharactersStore>().fetch();
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    _debouncer(() {
      if (_isBottom) {
        context.read<CharactersStore>().fetch();
      }
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CharactersStore>(context);
    return Observer(
      builder: (context) {
        final status = store.status;
        final items = store.filteredCharacters;
        final showLoader = !store.hasReachedMax;
        if (status == StoreStatus.loading && items.isEmpty) {
          return const LoadingList();
        }
        if (status == StoreStatus.failure && items.isEmpty) {
          return Text(store.errorMessage ?? 'Something went wrong');
        }
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: Wrap(
                  children: GenderFilter.values
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(e.name),
                            selected: store.filter == e,
                            onSelected: (value) {
                              store.setGenderFilter(e);
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.builder(
                itemCount: items.length + (showLoader ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= items.length) {
                    return const BottomLoader();
                  }
                  final item = items[index];
                  return CardCharacter(character: item);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
