class OriginCountry {
  String? originCountry;

  OriginCountry({this.originCountry = ""});

  factory OriginCountry.fromJson(Map<String, dynamic> data) {
    final originCountry = data['origin_country'];
    return OriginCountry(originCountry: originCountry);
  }
}
