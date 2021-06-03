import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nutralike/models/address.dart';
import 'package:nutralike/data/address_operations.dart';

class AddAddressPage extends StatefulWidget {
  AddAddressPage({Key key}) : super(key: key);

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _addressController = TextEditingController();
  final _stl2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _countryController = TextEditingController();
  AddressOperations addressOperations = AddressOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
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
                controller: _addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Street Line 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _stl2Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Street Line 2'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _cityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'City'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _stateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'State'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _zipController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Zip Code'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _countryController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Country'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: (){
                  final address = Address(
                    name: _addressController.text,
                    stl2: _stl2Controller.text,
                    city: _cityController.text,
                    state: _stateController.text,
                    zip: _zipController.text,
                    country: _countryController.text
                  );
                  addressOperations.createAddress(address);
                  setState(() {
                    _addressController.clear();
                    _stl2Controller.clear();
                    _cityController.clear();
                    _stateController.clear();
                    _zipController.clear();
                    _countryController.clear();
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
