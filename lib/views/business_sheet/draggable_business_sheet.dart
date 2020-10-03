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
            color: Colors.grey,
            child: ListView(
              controller: scrollController,
              children: [
                SizedBox(
                  height: 50,
                  child: Divider(
                    color: Colors.black,
                    thickness: 5,
                    endIndent: MediaQuery.of(context).size.width * 0.25,
                    indent: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 200,
                  child: Text("Title"),
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Text("Address, phone number, website, and category"),
                ),
                Container(
                  color: Colors.green,
                  height: 200,
                  child: Text("Image"),
                ),
                Container(
                  color: Colors.red,
                  height: 200,
                  child: Text("Description"),
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Text("Job Posting"),
                ),
                Container(
                  color: Colors.green,
                  height: 200,
                  child: Text("Coupons/Vouchers/Advertisement"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
