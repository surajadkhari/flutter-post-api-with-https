class UserModel {
  final String name;
  final String job;

  UserModel({required this.name, required this.job});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json["name"], job: json["job"]);
}
