import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/user_response_model.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key, required this.futureAlbum}) : super(key: key);
  Future<UserResponseModel>? futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Page"),
        ),
        body: FutureBuilder<UserResponseModel>(
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
        ));
  }
}
