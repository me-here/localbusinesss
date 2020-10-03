import "package:flutter/material.dart";

class RelevantInfo extends StatelessWidget {
  const RelevantInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 125,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "1900 University Ave, Austin, TX, 78705",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "(512) 404-3655",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Restaurant",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}