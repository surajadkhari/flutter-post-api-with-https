class UserResponseModel {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  UserResponseModel(
      {required this.name,
      required this.job,
      required this.id,
      required this.createdAt});
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
}
