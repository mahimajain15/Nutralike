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
                    border: OutlineInputBorder(), labelText: 'Address name'),
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
                      name: _addressController.text);
                  addressOperations.createAddress(address);
                  setState(() {
                    _addressController.clear();
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
