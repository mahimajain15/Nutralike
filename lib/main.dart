import 'package:flutter/material.dart';
import 'package:nutralike/presentation/pages/add_address_page.dart';
import 'package:nutralike/presentation/pages/add_person_page.dart';
import 'package:nutralike/presentation/pages/persons_page.dart';
import 'package:nutralike/presentation/pages/edit_person_page.dart';
// import 'package:nutralike/presentation/pages/search_persons.dart';
// import 'package:nutralike/presentation/pages/search_persons_by_address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutralike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => PersonsPage(),
        '/addPersonPage': (context) => AddPersonPage(),
        '/edit': (context) => EditPersonPage(),
        // '/searchPage': (context) => SearchPage(),
        '/addAddressPage': (context) => AddAddressPage(),
        // '/searchPersonsByAddress': (context) =>SearchPersonsByAddress()
      },
      home: PersonsPage(),
    );
  }
}
