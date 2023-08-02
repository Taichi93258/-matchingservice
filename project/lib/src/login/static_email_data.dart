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
  final emailParts = email.split("@");
  if (emailParts.length != 2) {
    return "正しいメールアドレスを入力してください";
  }

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
