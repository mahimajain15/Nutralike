import 'package:nutralike/data/database.dart';
import 'package:nutralike/models/address.dart';

class AddressOperations {
  AddressOperations addressOperations;
  final dbProvider = DatabaseRepository.instance;
  createAddress(Address address) async {
    final db = await dbProvider.database;
    db.insert('address', address.toMap());
    print('address inserted');
  }
  Future<List<Address>> getAllAddresses() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('address');
    List<Address> addresses =
    allRows.map((address) => Address.fromMap(address)).toList();
    return addresses;
  }
}