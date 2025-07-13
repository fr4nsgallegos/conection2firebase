import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:con2g12/models/user_model.dart';
import 'package:con2g12/pages/user_info_page.dart';
import 'package:flutter/material.dart';

class FutureListPage extends StatelessWidget {
  CollectionReference userReference = FirebaseFirestore.instance.collection(
    "users",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future List")),
      body: Center(
        child: FutureBuilder(
          future: userReference.get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("---------------------------------");
            print("snapshot: $snapshot");
            print("Connection state: ${snapshot.connectionState}");
            print("Data: ${snapshot.data}");
            print("---------------------------------");
            if (snapshot.hasData) {
              QuerySnapshot userCollection = snapshot.data;
              List<QueryDocumentSnapshot> docs = userCollection.docs;
              List<UserModel> users = docs.map((user) {
                return UserModel.fromMap(
                  user.data() as Map<String, dynamic>,
                  user.id,
                );
              }).toList();
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      title: Text(users[index].name),
                      subtitle: Text(users[index].lastname),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInfoPage(users[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
