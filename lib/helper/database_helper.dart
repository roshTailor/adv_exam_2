import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> copyDatabase() async {
  // Get the directory for storing the database file
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'product.db');

  // Check if the database file already exists
  bool fileExists = await databaseExists(path);

  if (!fileExists) {
    // If the file doesn't exist, copy it from the assets folder
    ByteData data = await rootBundle.load(join('asset/database/product.db'));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}
//
// Future<int> updateUser(Product product) async {
//   int result = await db!.update(
//     'users',
//     user.toMap(),
//     where: "id = ?",
//     whereArgs: [user.id],
//   );
//   return result;
// }
/*
class DatabaseHelper{
  DatabaseHelper._();
  static final DatabaseHelper databaseHelper = DatabaseHelper._();
  static Database? _database;
  var query;
  static Future<Database?> get database async{
    String path = await getDatabasesPath();
    final status = await databaseExists(path);
    if (status != null ) {
      print("Database");
      _database = await openDatabase(
        join(path, 'product.db'),
        onCreate: (database, version) {
          return database.execute(
            "CREATE TABLE product("
                "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                "productName TEXT,"
                "productPrice NUMBER)",
          );
        },
        version: 1,
      );
    } else {
      print("Else");
    }
    return _database;
  }

  Future<bool> insertUser(Product product) async {
    final db = await database;
    try {
      db!.insert('users', product.toMap());
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<List<Product>> retrieveUsers() async {
    Database? db = await database;
    List<Map> list = await db!.rawQuery("SELECT * FROM product");
    List<Product> product = [];
    for (int i = 0; i < list.length; i++) {
      product.add(Product(productName: list[i]['productName'], productPrice: list[i]['productPrice']));
    }
    return product;
  }
}
*/

    /*import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/User.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper databaseHelper = DatabaseHelper._();
  static Database? _database;
  var queryResult;
  //creating user database
  static Future<Database?> get database async {
    String path = await getDatabasesPath();
    final status = await databaseExists(path);
    if (status != null) {
      print("Database");
      _database = await openDatabase(
        join(path, 'users_demo.db'),
        onCreate: (database, version) {
          return database.execute(
            "CREATE TABLE users("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "name TEXT,"
            "age TEXT,"
            "email TEXT)",
          );
        },
        version: 1,
      );
    } else {
      print("Else");
    }
    return _database;
  }

  //CRUD Operations for User model class

  Future<bool> insertUser(User user) async {
    final db = await database;
    try {
      db!.insert('users', user.toMap());
    } catch (e) {
      print(e);
    }
    return true;
    // int result = await db!.insert('users', user.toMap());
    // return result;
  }

  Future<int> updateUser(User user) async {
    Database? db = await database;
    int result = await db!.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    Database? db = await database;
    List<Map> list = await db!.rawQuery("SELECT * FROM users");
    List<User> user = [];
    for (int i = 0; i < list.length; i++) {
      user.add(User(name: list[i]['name'], age: list[i]['age'], email: list[i]['email']));
    }
    return user;
  }

  Future<void> deleteUser(int id) async {
    Database? db = await database;
    await db!.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}*/