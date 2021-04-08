// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao? _articleDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ArticleEntity` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, `articleUrl` TEXT NOT NULL, `date` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _articleEntityInsertionAdapter = InsertionAdapter(
            database,
            'ArticleEntity',
            (ArticleEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'imageUrl': item.imageUrl,
                  'articleUrl': item.articleUrl,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ArticleEntity> _articleEntityInsertionAdapter;

  @override
  Future<List<ArticleEntity>> getArticles() async {
    return _queryAdapter.queryList('select * FROM ArticleEntity',
        mapper: (Map<String, Object?> row) => ArticleEntity(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            imageUrl: row['imageUrl'] as String,
            articleUrl: row['articleUrl'] as String,
            date: row['date'] as String));
  }

  @override
  Future<ArticleEntity?> getArticleById(int id) async {
    return _queryAdapter.query('select * from ArticleEntity where id = ?1',
        mapper: (Map<String, Object?> row) => ArticleEntity(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            imageUrl: row['imageUrl'] as String,
            articleUrl: row['articleUrl'] as String,
            date: row['date'] as String),
        arguments: [id]);
  }

  @override
  Future<void> saveArticles(List<ArticleEntity> articles) async {
    await _articleEntityInsertionAdapter.insertList(
        articles, OnConflictStrategy.replace);
  }
}
