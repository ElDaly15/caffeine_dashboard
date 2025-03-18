class BranchModel {
  final String id;
  final String branchnameEn;
  final String branchnameAr;
  final String cityEn;
  final String cityAr;
  final String countryEn;
  final String countryAr;
  final String streetEn;
  final String streetAr;

  BranchModel({
    required this.id,
    required this.branchnameEn,
    required this.branchnameAr,
    required this.cityEn,
    required this.cityAr,
    required this.countryEn,
    required this.countryAr,
    required this.streetEn,
    required this.streetAr,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      branchnameEn: json['branchnameEn'],
      branchnameAr: json['branchnameAr'],
      cityEn: json['cityEn'],
      cityAr: json['cityAr'],
      countryEn: json['countryEn'],
      countryAr: json['countryAr'],
      streetEn: json['streetEn'],
      streetAr: json['streetAr'],
    );
  }

  toJson() {
    return {
      'id': id,
      'branchnameEn': branchnameEn,
      'branchnameAr': branchnameAr,
      'cityEn': cityEn,
      'cityAr': cityAr,
      'countryEn': countryEn,
      'countryAr': countryAr,
      'streetEn': streetEn,
      'streetAr': streetAr,
    };
  }
}
