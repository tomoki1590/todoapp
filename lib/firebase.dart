import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FireBaseApp extends StatefulWidget {
  const FireBaseApp({Key? key}) : super(key: key);

  @override
  _FireBaseAppState createState() => _FireBaseAppState();
}
class _FireBaseAppState extends State<FireBaseApp> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('book').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO"),),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['author']),
                subtitle: Text(data['title']),

              );
            }).toList(),
          );
        },
    ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "incremanet",
        child: Icon(Icons.add),
      ),
    );
  }
}
