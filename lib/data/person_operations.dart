import 'package:nutralike/data/database.dart';
import 'package:nutralike/models/address.dart';
import 'package:nutralike/models/person.dart';

class PersonOperations {
  PersonOperations personOperations;

  final dbProvider = DatabaseRepository.instance;

  createPerson(Person person) async {
    final db = await dbProvider.database;
    db.insert('person', person.toMap());
    print('person inserted');
  }

  updatePerson(Person person) async {
    final db = await dbProvider.database;
    db.update('person', person.toMap(),
        where: "personId=?", whereArgs: [person.id]);
  }

  deletePerson(Person person) async {
    final db = await dbProvider.database;
    await db.delete('person', where: 'personId=?', whereArgs: [person.id]);
  }

  Future<List<Person>> getAllPersons() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('person');
    List<Person> persons =
    allRows.map((person) => Person.fromMap(person)).toList();
    return persons;
  }

  Future<List<Person>> getAllPersonsByAddress(Address address) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.rawQuery('''
    SELECT * FROM person 
    WHERE person.FK_person_address = ${address.id}
    ''');
    List<Person> persons =
    allRows.map((person) => Person.fromMap(person)).toList();
    return persons;
  }

  Future<List<Person>> searchPersons(String keyword) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db
        .query('person', where: 'personName LIKE ?', whereArgs: ['%$keyword%']);
    List<Person> persons =
    allRows.map((person) => Person.fromMap(person)).toList();
    return persons;
  }
}

//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position
