import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectTask extends StatefulWidget {
  const SubjectTask({super.key});

  @override
  State<SubjectTask> createState() => _SubjectTaskState();
}

class _SubjectTaskState extends State<SubjectTask> {
  CollectionReference subject = FirebaseFirestore.instance.collection('subjects');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<QuerySnapshot<Object?>>(
          future: subject.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("wrong");
            }

            if (snapshot.hasData == false && snapshot.data == null) {
              return Text("there is no data");
            }
            print(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                     "${snapshot.data!.docs[index]['task1']}, ${snapshot.data!.docs[index]['task2']}, ${snapshot.data!.docs[index]['task3']}" ,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,));
                },);
            }
            return Text("loading");
          },
        ));
  }
}
