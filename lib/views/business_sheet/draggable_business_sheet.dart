import 'package:flutter/material.dart';

class DraggableBusinessSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.07,
        maxChildSize: 0.95,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              children: [
                Header(),
                BusinessTitle(),
                RelevantInfo(),
                BusinessImages(),
                Description(),
                JobPostings(),
                CouponsAndVouchers(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Divider(
        color: Colors.black,
        thickness: 5,
        endIndent: MediaQuery.of(context).size.width * 0.25,
        indent: MediaQuery.of(context).size.width * 0.25,
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
      child: Container(
        color: Colors.red,
        height: 200,
        child: Text("Title"),
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
        child: Container(
      color: Colors.blue,
      height: 200,
      child: Text("Address, phone number, website, and category"),
    ));
  }
}

class BusinessImages extends StatelessWidget {
  const BusinessImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.green,
        height: 200,
        child: Text("Image"),
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
        child: Container(
      color: Colors.red,
      height: 200,
      child: Text("Description"),
    ));
  }
}

class JobPostings extends StatelessWidget {
  const JobPostings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.blue,
        height: 200,
        child: Text("Job Posting"),
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
      child: Container(
        color: Colors.green,
        height: 200,
        child: Text("Coupons/Vouchers/Advertisement"),
      ),
    );
  }
}
