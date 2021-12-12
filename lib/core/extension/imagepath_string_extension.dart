extension ImagePathExtension on String {
  String imagePath() => replaceFirst(".", "assets/");
}

extension Money on String {
  String moneyTL() => toString() + " TL";
}
