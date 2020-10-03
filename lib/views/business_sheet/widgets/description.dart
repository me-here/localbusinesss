import "package:flutter/material.dart";

class Description extends StatelessWidget {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Try out Carillion",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Innovative chefs, quality ingredients, masterfully-constructed dishes, a comfortably elegant atmosphere, and top-notch service. We serve beautifully-plated dishes and provide inspiring cuisine to make dining at The Carillon one of the best dining experiences in Austin.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}