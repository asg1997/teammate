extension SafetyIndexExtension<T> on List<T> {
  T? tryAtIndex(int index) => index < 0 || index >= length ? null : this[index];
}
