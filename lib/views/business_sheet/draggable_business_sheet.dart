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
        : Container();
  }
}
