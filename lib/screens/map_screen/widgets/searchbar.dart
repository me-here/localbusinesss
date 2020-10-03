import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a local business',
                fillColor: Colors.lightBlue,
              ),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
