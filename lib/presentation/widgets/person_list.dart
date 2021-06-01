import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutralike/data/person_operations.dart';
import 'package:nutralike/models/person.dart';
import 'package:nutralike/presentation/pages/edit_person_page.dart';

class PersonsList extends StatelessWidget {
  List<Person> persons;
  PersonOperations personOperations = PersonOperations();

  PersonsList(List<Person> this.persons, {
    Key key
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${persons[index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Text(
                        //   ' ${persons[index].id} ',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          ' ${persons[index].name}  ${persons[index].cid}', //${persons[index].address}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPersonPage(
                                        person: persons[index],
                                      )
                                  )
                              );
                            },
                            color: Colors.black,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            onDismissed: (direction) {
              personOperations.deletePerson(persons[index]);
            },
          );
        },
      ),
    );
  }
}
