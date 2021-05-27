import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/address_operations.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/models/person.dart';
import 'package:nutralike/models/address.dart';
import 'package:nutralike/presentation/widgets/addresses_dropdown.dart';
import 'package:nutralike/presentation/widgets/person_list.dart';


class SearchPersonsByAddress extends StatefulWidget {
  SearchPersonsByAddress({Key key}) : super(key: key);

  @override
  _SearchPersonsByAddressState createState() => _SearchPersonsByAddressState();
}

class _SearchPersonsByAddressState extends State<SearchPersonsByAddress> {

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
        title: Text('Search'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Address>>(
              future: addressOperations.getAllAddresses(),
              builder: (context, snapshot) {
                return snapshot.hasData ? AddressesDropDown(snapshot.data, callback) : Text('No categories');
              },
            ),
            FutureBuilder(
              future: personOperations.getAllPersonsByAddress(_selectedAddress),
              builder: (context, snapshot){
                // if(snapshot.hasError) print('error');
                var data = snapshot.data;
                return snapshot.hasData ? PersonsList(data) : new Center(child: Text('You have no persons'),);
              },
            ),
          ],
        ),
      ),

    );
  }
}
