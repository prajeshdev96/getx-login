import 'dart:async';

import 'package:floor/floor.dart';
import 'package:getx_login/data/local/my_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../modal/modal.dart';
import 'my_dao.dart';

part 'app_database.g.dart';

@Database(version:1,entities: [User])
abstract class AppDatabase extends FloorDatabase {
  MyDao get MyDAO;
}