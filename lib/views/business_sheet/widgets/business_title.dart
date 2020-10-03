import "package:flutter/material.dart";

class BusinessTitle extends StatelessWidget {
  const BusinessTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              "Title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                ),
                Text(
                  "0.5 Miles Away",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}