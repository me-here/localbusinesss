import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.hardEdge,
        child: IconButton(
          icon: Icon(Icons.settings),
          iconSize: 30,
          splashColor: Colors.grey,
          onPressed: () => print("kjkj"),
        ),
      ),
    );
  }
}
