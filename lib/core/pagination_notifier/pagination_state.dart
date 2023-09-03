abstract class PaginationState<T> {
  const PaginationState();
  const factory PaginationState.data(List<T> items) = _DataPaginationState;
  const factory PaginationState.loading() = _LoadingPaginationState;
  const factory PaginationState.error(Object? error, StackTrace? stk) =
      _ErrorPaginationState;
  const factory PaginationState.onGoingLoading(List<T> items) =
      _OnGoingLoadingState;
}

class _DataPaginationState<T> extends PaginationState<T> {
  const _DataPaginationState(this.items);
  final List<T> items;
}

class _LoadingPaginationState<T> extends PaginationState<T> {
  const _LoadingPaginationState();
}

class _ErrorPaginationState<T> extends PaginationState<T> {
  const _ErrorPaginationState(this.error, [this.stk]);
  final Object? error;
  final StackTrace? stk;
}

class _OnGoingLoadingState<T> extends PaginationState<T> {
  const _OnGoingLoadingState(this.items);
  final List<T> items;
}

extension PaginationStateExtension<T> on PaginationState<T> {
  R when<R>({
    required R Function(List<T> items) data,
    required R Function() loading,
    required R Function(Object? error, StackTrace? stk) error,
    required R Function(List<T> items) onGoingLoading,
  }) {
    if (this is _DataPaginationState<T>) {
      return data((this as _DataPaginationState<T>).items);
    } else if (this is _LoadingPaginationState<T>) {
      return loading();
    } else if (this is _ErrorPaginationState<T>) {
      final errorState = this as _ErrorPaginationState<T>;
      return error(errorState.error, errorState.stk);
    } else if (this is _OnGoingLoadingState<T>) {
      return onGoingLoading((this as _OnGoingLoadingState<T>).items);
    } else {
      throw Exception('Unknown state: $this');
    }
  }

  R maybeWhen<R>({
    required R Function(PaginationState<T> state) orElse,
    R Function(List<T> items)? data,
    R Function()? loading,
    R Function(Object? error, StackTrace? stk)? error,
    R Function(List<T> items)? onGoingLoading,
  }) {
    if (this is _DataPaginationState<T> && data != null) {
      return data((this as _DataPaginationState<T>).items);
    } else if (this is _LoadingPaginationState<T> && loading != null) {
      return loading();
    } else if (this is _ErrorPaginationState<T> && error != null) {
      final errorState = this as _ErrorPaginationState<T>;
      return error(errorState.error, errorState.stk);
    } else if (this is _OnGoingLoadingState<T> && onGoingLoading != null) {
      return onGoingLoading((this as _OnGoingLoadingState<T>).items);
    } else {
      return orElse(this);
    }
  }
}
