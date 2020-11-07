import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../sheet_provider.dart';

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
              // Takes the title from sheet_provider.dart
              context.watch<SheetProvider>().title,
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
                  // Takes the distance from sheet_provider.dart
                  "${context.watch<SheetProvider>().metersAway} meters away",
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
