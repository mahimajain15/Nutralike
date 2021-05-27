import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/models/person.dart';
import 'package:nutralike/presentation/widgets/person_list.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
  }) : super(
    key: key,
  );

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  PersonOperations contactOperations = PersonOperations();
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Person'),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'keyword'),
                  onChanged: (value) {
                    keyword = value;
                    setState(() {

                    });
                  },
                ),
              ),
              FutureBuilder(
                future: contactOperations.searchPersons(keyword),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print('error');
                  var data = snapshot.data;
                  return snapshot.hasData ? PersonsList(data) : new Center(child: Text('No contacts that include this keyword'),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
