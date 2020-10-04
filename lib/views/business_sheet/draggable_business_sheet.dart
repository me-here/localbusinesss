import 'package:flutter/material.dart';
import 'package:localbusiness/views/business_sheet/sheet_provider.dart';
import 'package:localbusiness/views/business_sheet/widgets/additional_documents.dart';
import "package:provider/provider.dart";

import "widgets/header.dart";
import "widgets/business_title.dart";
import "widgets/relevant_info.dart";
import "widgets/business_images.dart";
import "widgets/description.dart";
import "widgets/job_postings.dart";
import 'widgets/additional_documents.dart';

class DraggableBusinessSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return context
        .watch<DraggableSheetViewModel>()
        .isSheetOpen ? Container(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.07,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    shrinkWrap: true,
                    slivers: <Widget>[
                      Header(),
                      SliverFillRemaining(
                        child: ListView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          children: [
                            BusinessTitle(),
                            Divider(),
                            RelevantInfo(),
                            Divider(),
                            BusinessImages(),
                            Divider(),
                            Description(),
                            Divider(),
                            JobPostings(context
                                .watch<DraggableSheetViewModel>()
                                .listOfJobs),
                            Divider(),
                            AdditionalDocuments(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    )
        :
    Container();
  }
}

