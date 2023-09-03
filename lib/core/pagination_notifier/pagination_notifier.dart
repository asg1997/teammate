import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required Future<List<T>> Function(T?, int) fetchNextItems,
    int itemsPerBatch = 20,
    List<T> items = const [],
  })  : _itemsPerBatch = itemsPerBatch,
        _fetchNextItems = fetchNextItems,
        _items = items,
        super(PaginationState.data(items)) {
    _init();
  }

  final Future<List<T>> Function(T? lastItemInResult, int offset)
      _fetchNextItems;
  final int _itemsPerBatch;

  List<T> _items;
  List<T> get items => _items;

  Timer _timer = Timer(Duration.zero, () {});

  bool _noMoreItems = false;
  bool get noMoreItems => _noMoreItems;

  void _init() {
    if (_items.isEmpty) _fetchFirstBatch();
  }

  void _updateData(List<T> result) {
    _noMoreItems = result.length < _itemsPerBatch;
    if (result.isNotEmpty) {
      _items = [..._items, ...result];
    }
    state = PaginationState.data(_items);
  }

  Future<void> _fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();
      final result = _items.isEmpty
          ? await _fetchNextItems(null, 0)
          : await _fetchNextItems(_items.last, _items.length);
      _updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (_noMoreItems) return;
    if (_timer.isActive == true) return;
    if (state == PaginationState.onGoingLoading(_items)) return;

    _timer = Timer(const Duration(milliseconds: 500), () {});
    state = PaginationState.onGoingLoading(_items);
    try {
      final result = await _fetchNextItems(_items.last, _items.length);
      _updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  void updateElementAtIndex(int index, T updatedElement) {
    List<T> copyWithNewItem() {
      final updatedItems = [...items];
      updatedItems[index] = updatedElement;
      return updatedItems;
    }

    state.maybeWhen<void>(
      data: (items) {
        _items = copyWithNewItem();
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = copyWithNewItem();
        state = PaginationState.onGoingLoading(_items);
        return;
      },
      orElse: (_) {},
    );
  }

  void removeElementAt(int index) {
    state.maybeWhen<void>(
      data: (items) {
        _items = [...items]..removeAt(index);
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = [...items]..removeAt(index);
        state = PaginationState.onGoingLoading(_items);
        return;
      },
      orElse: (_) {},
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
