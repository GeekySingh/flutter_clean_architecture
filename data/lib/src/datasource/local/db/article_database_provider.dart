import 'package:data/src/datasource/local/dao/base/base_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _DB_NAME = 'ArticleDatabase';
const _DB_VERSION = 1;

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();
  static DatabaseProvider get = _instance;

  Database _db;
  Database get db =>
      _db != null ? _db : throw ('Have you forgot to call init() method?');

  DatabaseProvider._internal();

  Future init(List<BaseDao> daoList) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _DB_NAME);

    _db = await openDatabase(path, version: _DB_VERSION,
        onCreate: (Database db, int version) async {

      // create table for each defined dao
      daoList.forEach((dao) async {
        await db.execute(dao.createTableQuery);
      });
    });
  }
}
