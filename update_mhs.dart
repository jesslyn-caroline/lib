import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateMhs extends StatefulWidget {
  UpdateMhs({super.key, required this.data});

  Map<String, dynamic> data;

  @override
  State<UpdateMhs> createState() => _UpdateMhsState(data);
}

class _UpdateMhsState extends State<UpdateMhs> {
  _UpdateMhsState(this.data);

  Map<String, dynamic> data;

  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController nameC = TextEditingController();
  TextEditingController nimC = TextEditingController();
  TextEditingController classC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameC.text = data["nama"];
    nimC.text = data["nim"];
    classC.text = data["kelas"];

    super.initState();
  }

  Future<void> add() async {
    try {
      Map<String, dynamic> data = {
        "nama": nameC.text,
        "nim": nimC.text,
        "kelas": classC.text,
      };
      await db.collection('mahasiswa').doc(data["id"]).update(data);
      Navigator.of(context).pop();
    } catch (err) {
      print("ERROR: $err");
    }
  }

  String groupVal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: ListView(
          children: [
            TextField(
              controller: nameC,
              decoration: InputDecoration(hintText: "Nama"),
            ),
            TextField(
              controller: nimC,
              decoration: InputDecoration(hintText: "NIM"),
            ),
            TextField(
              controller: classC,
              decoration: InputDecoration(hintText: "Kelas"),
            ),
            Text("Gender"),
            Radio(
              value: "perempuan",
              groupValue: groupVal,
              onChanged: (value) {
                groupVal = value!;
                setState(() {});
              },
            ),
            Radio(
              value: "laki-laki",
              groupValue: groupVal,
              onChanged: (value) {
                groupVal = value!;
                setState(() {});
              },
            ),
            ElevatedButton(onPressed: add, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
