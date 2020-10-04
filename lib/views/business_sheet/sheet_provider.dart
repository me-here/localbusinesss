import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class DraggableSheetViewModel extends ChangeNotifier {


  var isSheetOpen = false;

  final jobs = [{"position" : "Cook", "type" : "Full Time", "urgency" : "Urgent"},
    {"position" : "Janitor", "type" : "Part Time", "urgency" : "Not Urgent"},
    {"position" : "Manager", "type" : "Full Time", "urgency" : "Urgent"},
  ];

  List get listOfJobs => jobs;

  void openSheet() {
    isSheetOpen = true;
    notifyListeners();
  }

  void closeSheet() {
    isSheetOpen = false;
    notifyListeners();
  }


}