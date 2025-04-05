class NotificationModel {
  String titleEn;
  String titleAr;
  String bodyEn;
  String bodyAr;
  final String id;
  final dynamic date;

  NotificationModel({
    required this.titleEn,
    required this.titleAr,
    required this.bodyEn,
    required this.bodyAr,
    required this.id,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      titleEn: json['titleEn'],
      id: json['id'],
      titleAr: json['titleAr'],
      bodyEn: json['bodyEn'],
      bodyAr: json['bodyAr'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titleEn': titleEn,
      'titleAr': titleAr,
      'bodyEn': bodyEn,
      'id': id,
      'bodyAr': bodyAr,
    };
  }
}
