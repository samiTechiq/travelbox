class CardData {
  String email;
  String firstName;
  String lastName;
  DateTime dob;
  String idCard;
  String idCardCode;
  final int index;

  CardData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.index,
    required this.dob,
    required this.idCard,
    required this.idCardCode,
  });

  CardData copyWith({
    String? email,
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? idCard,
    String? idCardCode,
    int? newIndex,
  }) {
    return CardData(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      idCard: idCard ?? this.idCard,
      idCardCode: idCardCode ?? this.idCardCode,
      index: newIndex ?? index,
    );
  }

  factory CardData.initial() {
    return CardData(
      email: '',
      firstName: '',
      lastName: '',
      dob: DateTime.now(),
      idCard: '',
      idCardCode: '',
      index: 0,
    );
  }
}
