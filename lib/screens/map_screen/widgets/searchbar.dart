import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a local business',
                fillColor: Colors.lightBlue,
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
