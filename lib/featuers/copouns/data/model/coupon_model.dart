class CouponModel {
  String copounTitle;
  String copounCode;
  num copounValue;
  String id;

  CouponModel({
    required this.copounTitle,
    required this.copounCode,
    required this.id,
    required this.copounValue,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      copounTitle: json['copounTitle'],
      copounCode: json['copounCode'],
      id: json['id'],
      copounValue: json['copounValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'copounTitle': copounTitle,
      'id': id,
      'copounCode': copounCode,
      'copounValue': copounValue,
    };
  }
}
