import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
  DatabaseRepository.privateConstructor();

  final _databaseName = 'database1 ';
  final _databaseVersion = 1;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
    }
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: await onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE person (
            personId INTEGER PRIMARY KEY AUTOINCREMENT,
            personName STRING NOT NULL,
            personCid STRING NOT NULL,
            personUid STRING NOT NULL,
            personPwd STRING NOT NULL,
            FK_person_address INT NOT NULL,
            FOREIGN KEY (FK_person_address) REFERENCES address (addressId) 
            
          )
          ''');

    await db.execute('''
          CREATE TABLE address (
            addressId INTEGER PRIMARY KEY AUTOINCREMENT,
            addressName STRING NOT NULL
          )
          ''');
  }
}