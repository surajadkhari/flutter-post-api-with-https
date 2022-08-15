class UserRequestModel {
  final String name;
  final String job;

  UserRequestModel({required this.name, required this.job});

    Map<String, dynamic> toJson() {
    return {
      "name": name,
      "job": job,
    };
  }

}
