class Profile {
  String name;
  String university;
  String faculty; //学部
  String department; //学科
  String grade; //学年
  DateTime birthday;
  String introduction;
  String imageURL;

  get birthdayFormatted =>
      "${birthday.year}年${birthday.month}月${birthday.day}日";

  Profile(
      {required this.name,
      required this.university,
      required this.faculty,
      required this.department,
      required this.grade,
      required this.birthday,
      required this.introduction,
      required this.imageURL});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json['name'] as String,
        university: json['university'] as String,
        faculty: json['faculty'] as String,
        department: json['department'] as String,
        grade: json['grade'] as String,
        birthday: DateTime.parse(['birthday'] as String),
        introduction: json['introduction'] as String,
        imageURL: json['imageURL'] as String);
  }

  Map<String, dynamic> get json => {
        'name': name,
        'university': university,
        'faculty': faculty,
        'department': department,
        'grade': grade,
        'birthday': birthday.toIso8601String(),
        'introduction': introduction,
        'imageURL': imageURL,
      };

  Profile.master()
      : name = "萩原麗生",
        university = "早稲田大学",
        faculty = "基幹理工学部",
        department = "情報理工",
        grade = "2年",
        birthday = DateTime(2003, 8, 5),
        introduction = "今から面白いこと言いま〜す！",
        imageURL =
            "https://st.depositphotos.com/1715570/2349/i/450/depositphotos_23493623-stock-photo-handsome-young-man.jpg";
}
