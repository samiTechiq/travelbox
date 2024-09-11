class LanguageData {
  final String name;
  final String countryCode;
  final String flag;
  final String? image;
  final String languageCode;

  LanguageData(
    this.name, {
    required this.countryCode,
    required this.flag,
    this.image,
    required this.languageCode,
  });

  factory LanguageData.enGB() => LanguageData(
        'English (UK)',
        countryCode: 'GB',
        flag: '🇬🇧',
        languageCode: 'en',
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageData &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
