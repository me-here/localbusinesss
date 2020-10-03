import 'package:flutter/material.dart';
import 'package:localbusiness/views/business_sheet/sheet_provider.dart';
import "package:provider/provider.dart";

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
                            CouponsAndVouchers(),
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

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      backgroundColor: Colors.white,
      floating: true,
      snap: true,
      pinned: true,
      title: Container(
        child: Divider(
          color: Colors.black,
          thickness: 5,
          endIndent: MediaQuery
              .of(context)
              .size
              .width * 0.25,
          indent: MediaQuery
              .of(context)
              .size
              .width * 0.25,
        ),
      ),
    );
  }
}

class BusinessTitle extends StatelessWidget {
  const BusinessTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              "Title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                ),
                Text(
                  "0.5 Miles Away",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RelevantInfo extends StatelessWidget {
  const RelevantInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 125,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "1900 University Ave, Austin, TX, 78705",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "(512) 404-3655",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Restaurant",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class Description extends StatelessWidget {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Try out Carillion",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Innovative chefs, quality ingredients, masterfully-constructed dishes, a comfortably elegant atmosphere, and top-notch service. We serve beautifully-plated dishes and provide inspiring cuisine to make dining at The Carillon one of the best dining experiences in Austin.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}

class JobPostings extends StatelessWidget {
  final jobList;

  JobPostings(this.jobList);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Looking for a Job?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 200,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              jobList.elementAt(index)["position"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              jobList.elementAt(index)["type"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              jobList.elementAt(index)["urgency"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CouponsAndVouchers extends StatelessWidget {
  const CouponsAndVouchers({
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
