class AdminModel {
  final String id;
  final String userName;
  final String linkUrl;
  final String password;
  bool isMainAdmin;

  AdminModel({
    required this.id,
    required this.isMainAdmin,
    required this.userName,
    required this.linkUrl,
    required this.password,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      linkUrl: json['linkUrl'] as String,
      isMainAdmin: json['isMainAdmin'] as bool,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'linkUrl': linkUrl,
      'password': password,
      'isMainAdmin': isMainAdmin,
    };
  }
}
