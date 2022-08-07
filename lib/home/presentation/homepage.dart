import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController job = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: name,
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
              controller: job,
              decoration: InputDecoration(
                  hintText: "Enter job",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ],
      ),
    );
  }
}
