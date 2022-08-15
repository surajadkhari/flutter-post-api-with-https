import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../controllers/user_controllers.dart';

class UserPage extends ConsumerWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(createuserProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("User Page"),
      ),
      body: data.when(data: (data) {
        final dateTime = DateFormat("dd MMM yyyy").format(data.createdAt);
        const textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                subtitle: Text(
                  dateTime,
                  style: textStyle,
                ),
                title: Text(
                  data.name,
                  style: textStyle,
                ),
                trailing: Text(
                  "ID ${data.id}",
                  style: textStyle,
                ),
              ),
            ],
          ),
        );
      }, error: (error, stackTrace) {
        return const Text("err");
      }, loading: (() {
        return const CircularProgressIndicator();
      })),
      //
    );
  }
}
