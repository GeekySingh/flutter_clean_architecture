
abstract class DatabaseProvider {
  String databaseName;
  int version;

  Future<Entity> insert<T>(T data);
  Future<T> update<T>(T data);
  Future<T> delete<T>(T data);
  Future<List<T>> query<T>();
}