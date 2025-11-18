import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData() async {
    List<Map<String, dynamic>> data = [];

    try {
      dynamic res = await db.collection('mahasiswa').get();
      data = res;
    } catch (err) {
      print("ERROR: $err");
    }

    return data;
  }

  Future<void> delete(String id) async {
    try {
      await db.collection('mahasiswa').doc(id).delete();
    } catch (err) {
      print("ERROR: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      // body: Fu,
    );
  }
}
