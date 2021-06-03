import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/data/address_operations.dart';
import 'package:nutralike/models/person.dart';
import 'package:nutralike/models/address.dart';
import 'package:nutralike/presentation/widgets/addresses_dropdown.dart';

class AddPersonPage extends StatefulWidget {
  AddPersonPage({Key key}) : super(key: key);

  @override
  _AddPersonPageState createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final _nameController = TextEditingController();
  final _cidController = TextEditingController();
  final _uidController = TextEditingController();
  final _pwdController = TextEditingController();
  PersonOperations personOperations = PersonOperations();
  AddressOperations addressOperations = AddressOperations();
  Address _selectedAddress;

  callback(selectedAddress){
    setState(() {
      _selectedAddress = selectedAddress;
      print(_selectedAddress.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Details'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _cidController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Company ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _uidController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'User ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _pwdController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                FutureBuilder<List<Address>>(
                  future: addressOperations.getAllAddresses(),
                  builder: (context, snapshot) {
                    return snapshot.hasData ? AddressesDropDown(snapshot.data, callback) : Text('No addresses');
              },
            ),
                ], ),),),
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: (){
                  final person = Person(
                      name: _nameController.text, cid: _cidController.text, uid: _uidController.text, pwd: _pwdController.text, address: _selectedAddress.id);
                  personOperations.createPerson(person);
                  setState(() {
                    _nameController.clear();
                    _cidController.clear();
                    _uidController.clear();
                    _pwdController.clear();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
