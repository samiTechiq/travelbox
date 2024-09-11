enum CardType {
  visa,
  verve,
  others, // Any other card issuer
  invalid,
  master // We'll use this when the card is invalid
}

CardType getCardTypeFrmNumber(String input) {
  CardType cardType;
  if (input.startsWith(
      RegExp(r'((5[1-5])|(222[1-9]|22[3-9]\d|2[3-6]\d{2}|27[01]\d|2720))'))) {
    cardType = CardType.master;
  } else if (input.startsWith(RegExp(r'4'))) {
    cardType = CardType.visa;
  } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
    cardType = CardType.verve;
  } else if (input.length <= 8) {
    cardType = CardType.others;
  } else {
    cardType = CardType.invalid;
  }
  return cardType;
}
