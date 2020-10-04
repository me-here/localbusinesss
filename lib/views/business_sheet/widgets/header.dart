import "package:flutter/material.dart";

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Divider(
        color: Colors.black,
        thickness: 5,
        endIndent: MediaQuery.of(context).size.width * 0.25,
        indent: MediaQuery.of(context).size.width * 0.25,
      ),
    );
  }
}
