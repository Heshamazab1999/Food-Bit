import 'package:app/constant.dart';
import 'package:app/models/favourite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseFavouriteServices {
  DataBaseFavouriteServices._();

  static final DataBaseFavouriteServices db = DataBaseFavouriteServices._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDb();
      return _database;
    }
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartFavouriteProduct.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
      CREATE TABLE ${K.tableCartFavourite} (
      ${K.columnName} TEXT NOT NULL,
      ${K.columnImage} TEXT NOT NULL,
      ${K.columnPrice} TEXT NOT NULL,
      ${K.columnRate} Text NOT NULL)
      ''');
        });
  }

  insert(FavouriteModel model) async {
    var dbClient = await database;
    await dbClient.insert(K.tableCartFavourite, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<FavouriteModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(K.tableCartFavourite);
    List<FavouriteModel> list = maps.isNotEmpty
        ? maps.map((e) => FavouriteModel.fromJson(e)).toList()
        : [];
    return list;
  }

}
