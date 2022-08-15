import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';
import 'package:flutter_http_post/home/repository/repo.dart';

import 'user_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<UserResponseModel>? futureuser;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController jobnamecontroller = TextEditingController();
  @override
  void dispose() {
    namecontroller.clear();
    jobnamecontroller.clear();
    super.dispose();
  }

  void keyboradMiss() {
    return FocusScope.of(context).unfocus();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: keyboradMiss,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildColumn(context)],
          ),
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
            // Map<String, dynamic> data = {
            //   "name": namecontroller.text,
            //   "job": jobnamecontroller.text
            // };

            if (_formKey.currentState!.validate()) {
              // await UserRepository().createUser(data);
              var userRequestModel = UserRequestModel(
                  name: namecontroller.text, job: jobnamecontroller.text);
              final result = UserRepository().createUser(userRequestModel);
              setState(() {
                futureuser = result;
              });
              // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: ((context) => UserPage(
                            data: futureuser,
                          ))));
              // });
            }
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
}
