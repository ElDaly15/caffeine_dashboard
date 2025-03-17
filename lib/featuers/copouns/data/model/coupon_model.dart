class CouponModel {
  String copounTitle;
  String copounCode;
  num copounValue;
  final List<String> users;
  bool isExpired;
  String id;

  CouponModel({
    required this.copounTitle,
    required this.copounCode,
    required this.id,
    required this.isExpired,
    required this.users,
    required this.copounValue,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      copounTitle: json['copounTitle'],
      isExpired: json['isExpired'],
      copounCode: json['copounCode'],
      id: json['id'],
      users: List<String>.from(json['users']),
      copounValue: json['copounValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'copounTitle': copounTitle,
      'id': id,
      'isExpired': isExpired,
      'copounCode': copounCode,
      'users': users,
      'copounValue': copounValue,
    };
  }
}
