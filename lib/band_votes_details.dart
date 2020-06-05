import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/services/admob_service.dart';
import 'package:flutter/material.dart';

import 'services/admob_service.dart';

class BandVotesDetails extends StatefulWidget {
  @override
  _BandVotesDetailsState createState() => _BandVotesDetailsState();
}

class _BandVotesDetailsState extends State<BandVotesDetails> {
  final ams = AdMobService();

  @override
  void initState() {
    super.initState();
    Admob.initialize(ams.getADMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad Mob Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: Firestore.instance.collection('bandnames').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: Text("Loading"));

                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return buildItem(
                          context, snapshot.data.documents[index], index);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  buildItem(BuildContext context, DocumentSnapshot document, int index) {
    if (index == 3) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: AdmobBanner(
              adUnitId: ams.getADMobAppId(),
              adSize: AdmobBannerSize.BANNER,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              margin: EdgeInsets.all(2),
              elevation: 2,
              child: Container(
                margin: EdgeInsets.all(9),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      document['name'],
                    ),
                    InkWell(
                      onTap: () {
//                        document.reference
//                            .updateData({'value': document['value'] + 1});
                      },
                      child: Text(
                        document['value'].toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        margin: EdgeInsets.all(2),
        elevation: 2,
        child: Container(
          margin: EdgeInsets.all(9),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                document['name'],
              ),
              InkWell(
                onTap: () {
                  document.reference
                      .updateData({'value': document['value'] + 1});
                },
                child: Text(
                  document['value'].toString(),
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
