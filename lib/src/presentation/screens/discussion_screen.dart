import 'package:advance/src/data/data_source/discussion_data_source.dart';
import 'package:advance/src/data/models/discussion_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: DiscussionDataSource().streamDiscussion(),
            builder: (context, snapshot) {
              List<DiscussionModel> discussions = (snapshot.data?.docs ?? [])
                  .map((e) => DiscussionModel.fromMap(e.data()))
                  .toList();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: discussions.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: discussions[index].email ==
                            FirebaseAuth.instance.currentUser?.email
                        ? Alignment.centerRight
                        : Alignment.centerRight,
                    child: Text(discussions[index].message),
                  );
                },
              );
            }),
        TextButton(
          onPressed: () async {
            await DiscussionDataSource().createDiscussion(
              DiscussionModel(
                  email: 'blablabla',
                  name: 'maulana',
                  pictureUrl: null,
                  timestamp: Timestamp.now(),
                  message: 'hallo bro !'),
            );
          },
          child: Text('add message'),
        )
      ],
    );
  }
}
