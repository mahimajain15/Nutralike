import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/models/address.dart';

class AddressesDropDown extends StatefulWidget {
  List<Address> addresses;

  Function(Address) callback;

  AddressesDropDown(
      this.addresses,
      this.callback, {
        Key key,
      }) : super(key: key);

  @override
  _AddressesDropDownState createState() => _AddressesDropDownState();
}

class _AddressesDropDownState extends State<AddressesDropDown> {
  var _item;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Address>(
        hint: Text('Select address'),
        onChanged: (Address value){
          setState(() {
            _item = widget.callback(value);
          });
        },
        value: _item,
        items: widget.addresses.map((address) {
          return DropdownMenuItem(
            value: address,
            child: Text(address.name),
          );
        }).toList()
    );
  }
}
