import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VotePage extends StatefulWidget {
  @override
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  List party = ['BJP', 'Congress'];
  FirebaseFirestore dbRef = FirebaseFirestore.instance;
  CollectionReference taskCRUD = FirebaseFirestore.instance.collection("party");

  bool da = true;
  var pa;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: dbRef.collection("party").snapshots(),
            builder: (context, ss) {
              if (ss.hasData) {
                if (ss.data != null) {
                  var data = ss.data.documents;
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, i) {
                        da = data[i]['Vote'];
                        var to= data[i]['total'];
                        var t= data[i].id;
                        return Card(
                          child: Container(
                            child: ListTile(
                                title: Text(data[i]['part'].toString()),
                                subtitle: Text(data[i]['total'].toString()),
                                // leading: Text(data[i]['Vote'].toString()),
                                trailing: (da == true)
                                    ? IconButton(
                                        icon: Icon(Icons.plus_one),
                                        onPressed: () {
                                          setState(() {

                                            cou(dbRef,t,to);
                                            for(i=0;i<100;i++) {
                                              updatedata(dbRef, data[i].id);
                                            }


                                            // updatedata(dbRef,t);
                                            // var dm = data[i]['total'].toString();

                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.exposure_zero),
                                      )),
                          ),
                        );
                      },
                    ),
                  );
                }
              } else {
                return Text("No Data......");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

updatedata(db,t) async {
  // List i = ['ASsY6Phh29GlWPbgNEcX'
  // ,'n778fbiDoyfH09tz9m71'];
  var data = {'Vote': false};
  // for(var i=0;i<=100;i++)
  //   {
  //     await db.collection('party').doc(t[i]).update(data);
  //   }
  await db.collection('party').doc(t).update(data);
  // await db.collection('party').doc(i[1]).update(data);
}

cou(db,t,dm) async {
  var aa=dm+1;
  print(dm);
  var data = {'total': aa};

  await db.collection('party').doc(t).update(data);
}
