import 'package:flutter/material.dart';

class DraggableSheetViewModel extends ChangeNotifier {

  final jobs = [{"position" : "Cook", "type" : "Full Time", "urgency" : "Urgent"},
    {"position" : "Janitor", "type" : "Part Time", "urgency" : "Not Urgent"},
    {"position" : "Manager", "type" : "Full Time", "urgency" : "Urgent"},
  ];

  List get listOfJobs => jobs;


}