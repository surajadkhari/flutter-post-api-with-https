class UserModel {
  final String name;
  final String job;

  UserModel({required this.name, required this.job});

    Map<String, dynamic> toJson() {
    return {
      "name": name,
      "job": job,
    };
  }

}
