class AdsModel {
  final String title, url, id;

  AdsModel({required this.title, required this.url, required this.id});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(title: json['title'], url: json['url'], id: json['id']);
  }

  toJson() {
    return {'title': title, 'url': url, 'id': id};
  }
}
