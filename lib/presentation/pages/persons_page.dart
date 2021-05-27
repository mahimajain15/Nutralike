import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/presentation/widgets/person_list.dart';
import 'package:nutralike/presentation/widgets/horizontal_button_bar.dart';

class PersonsPage extends StatefulWidget {
  PersonsPage({Key key})
      : super(
    key: key,
  );

  @override
  _PersonsPageState createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  PersonOperations personOperations = PersonOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HorizontalButtonBar(),
              FutureBuilder(
                future: personOperations.getAllPersons(),
                builder: (context, snapshot){
                  if(snapshot.hasError) print('error');
                  var data = snapshot.data;
                  return snapshot.hasData ? PersonsList(data) : new Center(child: Text('You have no persons'),);
                },
              ),
            ],
          ),

        ),
      ),
    );
  }
}
