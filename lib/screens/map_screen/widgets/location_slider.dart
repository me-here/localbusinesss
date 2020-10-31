import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../map_providerfinal.dart';

class LocationSlider extends StatelessWidget {
  const LocationSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (context, provider, child) => Slider.adaptive(
        value: provider.searchProximity,
        onChanged: provider.setSearchProximity,
        min: 500,
        max: 1500,
      ),
    );
  }
}
