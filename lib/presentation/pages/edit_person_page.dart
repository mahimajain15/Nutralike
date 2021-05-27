import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/models/person.dart';

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
          personOperations.updatePerson(widget.person);
        },
      ),
    );
  }
}
