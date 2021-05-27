import 'package:flutter/material.dart';

class HorizontalButtonBar extends StatelessWidget {
  HorizontalButtonBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                  child: Text('Person'),
                  textColor: Colors.white,
                  color: Colors.blueGrey,
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('/addPersonPage');
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: RaisedButton(
                child: Text('Address'),
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed('/addAddressPage');
                }
            ),)
          // FloatingActionButton(
          //   heroTag: 'add address button',
          //   onPressed: () {
          //     Navigator.of(context).pushReplacementNamed('/addAddressPage');
          //   },
          //   child: Icon(Icons.playlist_add_rounded),
          // ),
          // FloatingActionButton(
          //   heroTag: 'search person by address',
          //   onPressed: () {
          //     Navigator.of(context).pushReplacementNamed('/searchPersonsByAddress');
          //   },
          //   child: Icon(Icons.list),
          // ),

        ],
      ),
    );
  }
}
