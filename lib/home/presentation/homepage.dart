import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/presentation/flutter_doc.dart';

import '../repository/repo.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<Album>? futureAlbum;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          futureAlbum == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[100]),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {"title": controller.text};
                        UserRepository().createUser(data);
                        setState(() {
                          futureAlbum = UserRepository().createUser(data);
                        });
                      },
                      child: const Text('Create Data'),
                    ),
                  ],
                )
              : FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(child: Text(snapshot.data!.title));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  },
                ),
        ],
      ),
    );
  }
}
