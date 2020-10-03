import 'package:flutter/material.dart';
import 'package:localbusiness/screens/map_screen/widgets/searchbar.dart';
import 'package:provider/provider.dart';

import 'package:localbusiness/screens/map_screen/widgets/map_view.dart';
import 'package:localbusiness/screens/map_screen/widgets/location_slider.dart';
import 'package:localbusiness/screens/map_screen/widgets/settings_button.dart';
import "../../views/business_sheet/draggable_business_sheet.dart";
import './map_provider.dart';
import 'dart:math' as math;

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<MapProvider>(
          create: (context) => MapProvider(),
          builder: (context, child) => Stack(
            children: [
              MapView(),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SearchBar(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: [
                        Expanded(child: LocationSlider()),
                        SettingsButton(),
                      ],
                    ),
                  ),
                ),
              ),
              DraggableBusinessSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
