import 'package:flutter/material.dart';

class BusinessImages extends StatelessWidget {
  const BusinessImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        child: Image.network(
            "https://th.bing.com/th/id/OIP.QcUaYzmo1nZE9xWQgaOCaQHaEo?pid=Api&rs=1"),
      ),
    );
  }
}
