import 'profile.dart';

class UserDatabase {
  // TODO: Implement the interaction with database (maybe using aws)
  static Profile search(String email) {
    return Profile(
        name: "萩原麗生",
        university: "早稲田大学",
        faculty: "基幹理工学部",
        department: "情報理工",
        grade: "2年",
        birthday: DateTime(2003, 8, 5),
        introduction: "今から面白いこと言いま〜す！",
        imageURL:
            "https://st.depositphotos.com/1715570/2349/i/450/depositphotos_23493623-stock-photo-handsome-young-man.jpg");
  }

  static Profile nextPerson() {
    return search("");
  }
}
