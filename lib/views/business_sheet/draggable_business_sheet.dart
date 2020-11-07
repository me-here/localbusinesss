import 'package:flutter/material.dart';
import 'package:localbusiness/views/business_sheet/sheet_provider.dart';
import 'package:localbusiness/views/business_sheet/widgets/additional_documents.dart';
import "package:provider/provider.dart";
import 'package:sliding_up_panel/sliding_up_panel.dart';

import "widgets/header.dart";
import "widgets/business_title.dart";
import "widgets/relevant_info.dart";
import "widgets/business_images.dart";
import "widgets/description.dart";
import "widgets/job_postings.dart";
import 'widgets/additional_documents.dart';
import 'widgets/donate.dart';


class DraggableBusinessSheet extends StatefulWidget {
  @override
  _DraggableBusinessSheetState createState() => _DraggableBusinessSheetState();
}

class _DraggableBusinessSheetState extends State<DraggableBusinessSheet> {

  //Controller for the sliding_up_panel
  PanelController _pc = new PanelController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Looks at the isSheetOpen Variable to see if the sheet should or
    //should not be shown to the user. If not, an empty container is
    //shown in its place
    return context.watch<SheetProvider>().isSheetOpen
        ? SlidingUpPanel(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            controller: _pc,
            minHeight: MediaQuery.of(context).size.height * .08,
            maxHeight: MediaQuery.of(context).size.height,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            backdropEnabled: true,

            //Builds all of the information inside of the sliding_up_panel
            panelBuilder: (ScrollController sc) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: ListView(
                  controller: sc,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  children: [
                    Header(),
                    BusinessTitle(),
                    Divider(),
                    Donate(),
                    RelevantInfo(),
                    Divider(),
                    BusinessImages(),
                    Divider(),
                    Description(),
                    Divider(),
                    JobPostings(context.read<SheetProvider>().listOfJobs),
                    Divider(),
                    AdditionalDocuments(),
                  ],
                ),
              );
            })
        : Container(); //Empty container for if the sliding_up_panel shouldn't be shown
  }
}
