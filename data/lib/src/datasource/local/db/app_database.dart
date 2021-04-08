
import 'dart:async';

import 'package:data/src/datasource/local/dao/article_dao.dart';
import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ArticleEntity])
abstract class AppDatabase extends FloorDatabase {

  ArticleDao get articleDao;

}