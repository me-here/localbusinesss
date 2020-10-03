import 'package:flutter/material.dart';
import 'package:localbusiness/screens/map_screen/views/map_view.dart';
import 'package:localbusiness/screens/map_screen/views/settings_button.dart';
import "../../views/business_sheet/draggable_business_sheet.dart";

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MapView(),
            SettingsButton(),
            DraggableBusinessSheet(),
          ],
        ),
      ),
    );
  }
}
