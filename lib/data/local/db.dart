import 'app_database.dart';
import 'my_dao.dart';

class Db {
  static final Db _db = Db._internal();
  late AppDatabase database;
  late MyDao myDao;

  factory Db() {
    return _db;
  }

  Db._internal() {
    builder();
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    myDao = database.MyDAO;
  }
}