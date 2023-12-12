import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Authentication/login1.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
              child: Card(
                child: ListTile(
                  title: Text("Log Out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                  trailing: Icon(Icons.logout,color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.currentUser?.delete();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                child: Card(
                  child: ListTile(
                    title: Text("Detete Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
                    trailing: Icon(Icons.delete_sweep,color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
