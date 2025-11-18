import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMhs extends StatefulWidget {
  const AddMhs({super.key});

  @override
  State<AddMhs> createState() => _AddMhsState();
}

class _AddMhsState extends State<AddMhs> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    TextEditingController nameC = TextEditingController();
    TextEditingController nimC = TextEditingController();
    TextEditingController classC = TextEditingController();

    Future<void> add() async {
      try {
        Map<String, dynamic> data = {
          "nama": nameC.text,
          "nim": nimC.text,
          "kelas": classC.text,
        };
        await db.collection('mahasiswa').add(data);
        Navigator.of(context).pop();
      } catch (err) {
        print("ERROR: $err");
      }
    }

    String groupVal = "";

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
