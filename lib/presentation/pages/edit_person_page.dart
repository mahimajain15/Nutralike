import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/address_operations.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/models/address.dart';
import 'package:nutralike/models/person.dart';
import 'package:nutralike/presentation/widgets/addresses_dropdown.dart';

class EditPersonPage extends StatefulWidget {
  Person person;

  EditPersonPage({Key key, this.person})
      : super(
    key: key,
  );

  @override
  _EditPersonPageState createState() => _EditPersonPageState();
}

class _EditPersonPageState extends State<EditPersonPage> {
  PersonOperations personOperations = PersonOperations();
  AddressOperations addressOperations = AddressOperations();
  Address _selectedAddress;

  callback(selectedAddress){
    setState(() {
      _selectedAddress = selectedAddress;
      print(_selectedAddress.name);
    });
  }

  var _nameController = TextEditingController();
  var _cidController = TextEditingController();
  var _uidController = TextEditingController();
  var _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.person.name;
    _cidController.text = widget.person.cid;
    _uidController.text = widget.person.uid;
    _pwdController.text = widget.person.pwd;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit person details'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              FutureBuilder<List<Address>>(
                future: addressOperations.getAllAddresses(),
                builder: (context, snapshot) {
                  return snapshot.hasData ? AddressesDropDown(snapshot.data, callback) : Text('No addresses');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          widget.person.name= _nameController.text;
          widget.person.cid= _cidController.text;
          widget.person.uid = _uidController.text;
          widget.person.pwd = _pwdController.text;
          widget.person.address = _selectedAddress.id;
          personOperations.updatePerson(widget.person);
        },
      ),
    );
  }
}
