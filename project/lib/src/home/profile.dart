class Profile {
  String name;
  String university;
  String faculty; //学部
  String department; //学科
  String grade; //学年
  DateTime birthday;
  String introduction;
  String imageURL;

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
}
