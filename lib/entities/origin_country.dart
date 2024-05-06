class OriginCountry {
  String? origin_country;

  OriginCountry({this.origin_country = ""});

  factory OriginCountry.fromJson(Map<String, dynamic> data) {
    final origin_country = data['origin_country'];
    return OriginCountry(origin_country: origin_country);
  }
}
