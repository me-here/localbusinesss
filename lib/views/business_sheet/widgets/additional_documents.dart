import 'package:flutter/material.dart';

class AdditionalDocuments extends StatelessWidget {
  const AdditionalDocuments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        child: Image.network(
            "https://s-media-cache-ak0.pinimg.com/736x/91/df/4d/91df4d45d4d3e0dfe6ac212adda70508.jpg"),
      ),
    );
  }
}
