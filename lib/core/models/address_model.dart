class AddressModel {
  final String street;
  final String city;
  final String phoneNumber;
  final String coutry;

  AddressModel({
    required this.street,
    required this.city,
    required this.phoneNumber,
    required this.coutry,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      coutry: json['coutry'],
    );
  }

  toJson() => <String, dynamic>{
    'street': street,
    'city': city,
    'phoneNumber': phoneNumber,
    'coutry': coutry,
  };
}
