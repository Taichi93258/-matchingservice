class Profile {
  static const int dataLength = 8;
  String name;
  String university;
  String faculty; //学部
  String department; //学科
  String grade; //学年
  DateTime birthday;
  String introduction;
  String imageURL;

  String byId(int id) {
    switch (id) {
      case 0:
        return name;
      case 1:
        return university;
      case 2:
        return faculty;
      case 3:
        return department;
      case 4:
        return grade;
      case 5:
        return birthdayFormatted;
      case 6:
        return introduction;
      case 7:
        return imageURL;
      default:
        return "";
    }
  }

  static int getId(String name) {
    switch (name) {
      case "name":
        return 0;
      case "university":
        return 1;
      case "faculty":
        return 2;
      case "department":
        return 3;
      case "grade":
        return 4;
      case "birthday":
        return 5;
      case "introduction":
        return 6;
      case "imageURL":
        return 7;
      default:
        return -1;
    }
  }

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

  List<String> get indexed => [
        name,
        university,
        faculty,
        department,
        grade,
        birthdayFormatted,
        introduction,
        imageURL,
      ];

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
