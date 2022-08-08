import 'package:flutter/material.dart';
import '../data/user_response_model.dart';
import '../repository/repo.dart';
import 'package:intl/intl.dart';

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
          children: [
            futureAlbum == null ? buildColumn(context) : buildFutureBuilder(),
          ],
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
          onPressed: () {
            Map<String, dynamic> data = {
              "name": namecontroller.text,
              "job": jobnamecontroller.text
            };
            if (_formKey.currentState!.validate()) {
              UserRepository().createUser(data);
              setState(() {
                futureAlbum = UserRepository().createUser(data);
              });
            }
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<UserResponseModel> buildFutureBuilder() {
    return FutureBuilder<UserResponseModel>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final dateTime =
              DateFormat("dd MMM yyyy").format(snapshot.data!.createdAt);
          return Center(
            child: Column(
              children: [
                Text(snapshot.data!.name),
                Text(snapshot.data!.job),
                Text(dateTime),
                Text(snapshot.data!.id),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
