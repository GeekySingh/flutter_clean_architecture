abstract class BaseDao<T, K> {
  //queries
  String get createTableQuery;

  //abstract mapping methods
  T fromMap(K query);
  List<T> fromList(List<K> query);
  K toMap(T entity);
}