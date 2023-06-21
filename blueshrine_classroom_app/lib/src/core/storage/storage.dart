abstract interface class Storage {
  String? get(String key);

  void put<T>(String key, T value);

  void remove(String key);

  void clean();
}
