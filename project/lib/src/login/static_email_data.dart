const subdomains = <String, List<String>>{
  "waseda": ["akane", "asagi", "fuji", "moegi", "ruri", "suou", "toki"],
};

String universityTranslator(String domain) {
  switch (domain) {
    case "waseda":
      return "早稲田大学";
    default:
      return "";
  }
}

String? emailValidator(String email) {
  // validationg email using regex
  final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  if (!regex.hasMatch(email)) {
    return "メールアドレスの形式が不正です";
  }
  final emailParts = email.split("@");

  final domain = emailParts[1];
  final domainSplitted = domain.split(".");
  if (domainSplitted.length != 3) {
    return "＠以降が不正なメールアドレスです";
  }
  final university = domainSplitted[1];

  if (subdomains.keys.contains(university)) {
    final subdomainList = subdomains[university]!;
    for (final subdomain in subdomainList) {
      if (domain == "$subdomain.$university.jp") {
        return null;
      }
    }
  }
  return "有効な${universityTranslator(university)}のメールアドレスを入力してください";
}
