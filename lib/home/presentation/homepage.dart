import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/user_response_model.dart';
import '../repository/repo.dart';
import 'package:intl/intl.dart';

import 'user_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<UserResponseModel>? futureAlbum;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController jobnamecontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    namecontroller.clear();
    jobnamecontroller.clear();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildColumn(context)],
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: namecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Name",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[100]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter job';
              }
              return null;
            },
            controller: jobnamecontroller,
            decoration: InputDecoration(
                hintText: "Enter Job",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[100]),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            Map<String, dynamic> data = {
              "name": namecontroller.text,
              "job": jobnamecontroller.text
            };
            if (_formKey.currentState!.validate()) {
              // await UserRepository().createUser(data);
              setState(() {
                futureAlbum = UserRepository().createUser(data);
              });
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: ((context) => UserPage(
                            futureAlbum: futureAlbum,
                          ))));
            }
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

 
}
