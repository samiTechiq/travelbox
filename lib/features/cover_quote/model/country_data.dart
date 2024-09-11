class CountryData {
  final String name;
  final String code;
  final String flag;
  final String? currency;
  final String? image;
  final String? languageCode;

  CountryData(
    this.name, {
    required this.code,
    required this.flag,
    this.currency,
    this.image,
    this.languageCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryData &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
