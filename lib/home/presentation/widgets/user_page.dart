import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';
import 'package:intl/intl.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.data}) : super(key: key);
  final Future<UserResponseModel>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("User Page"),
        ),
        body: FutureBuilder<UserResponseModel>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data!;
              final dateTime =
                  DateFormat("dd MMM yyyy").format(snapshot.data!.createdAt);
              return Center(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: Text("Id ${result.id}"),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name:${result.name}"),
                            Text("job:${result.job}"),
                          ],
                        ),
                        trailing: Text(dateTime),
                      ),
                    ),
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
