class UserResponseModel {
  final String username;
  final String userjob;
  final int id;
  final DateTime createdAt;

  UserResponseModel(
      {required this.username,
      required this.userjob,
      required this.id,
      required this.createdAt});

  Map<String, dynamic> toJson() {
    return {
      "name": username,
      "job": userjob,
      "id": id,
      "createdAt": createdAt.toIso8601String()
    };
  }
}
