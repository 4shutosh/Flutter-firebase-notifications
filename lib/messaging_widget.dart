import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import './message.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final Firestore _db =Firestore.instance;


  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context,
          builder: (context)=>AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.only(top: 10),
            elevation: 4,
            titlePadding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            title: Text(message['notification']['title'],textAlign: TextAlign.center,),
            content:
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(message['notification']['body'],)
                    ],
                  ),
                ),
          )
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) => ListView(
    children: messages.map(buildMessage).toList(),
  );

  Widget buildMessage(Message message) => ListTile(
    title: Text(message.title),
    subtitle: Text(message.body),
  );
}




