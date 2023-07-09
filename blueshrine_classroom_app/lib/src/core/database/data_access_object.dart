abstract interface class DataAccessObject {
  Future<List<T>> fetchAll<T>(String? name);

  Future<T> fetchById<T>(int id);

  Future<void> save<T>(T data);

  Future<void> delete(int id);

  Stream<List<T>> listenToData<T>();
}
