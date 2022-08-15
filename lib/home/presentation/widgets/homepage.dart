import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/user_controllers.dart';
import 'user_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: keyboradMiss,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildColumn(context, screenWidth, screenHeight)],
          ),
        ),
      ),
    );
  }

  Column buildColumn(
      BuildContext context, double screenWidth, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            textInputAction: TextInputAction.next,
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
            textInputAction: TextInputAction.done,
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
        Consumer(
          builder: ((context, ref, child) {
            final postUser = ref.watch(createuserProvider.notifier);
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : AspectRatio(
                        aspectRatio: screenWidth * 0.6 / screenHeight * 20,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                UserRequestModel userRequestModel =
                                    UserRequestModel(
                                  name: namecontroller.text,
                                  job: jobnamecontroller.text,
                                );
                                await postUser.postUser(userRequestModel);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: ((context) => const UserPage()),
                                  ),
                                );
                              }
                            },
                            child: const Text('Submit')),
                      ));
          }),
        ),
      ],
    );
  }
}
