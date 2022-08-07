import 'package:flutter/material.dart';

import '../data/user_response_model.dart';
import '../repository/repo.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          futureAlbum == null
              ? buildColumn(context)
              : buildFutureBuilder(),
        ],
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
                      UserRepository().createUser(data);
                      setState(() {
                        futureAlbum = UserRepository().createUser(data);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("data is summited")));
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data!.name),
              Text(snapshot.data!.job),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
