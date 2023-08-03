import 'package:project/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/src/home/user_database.dart';
import 'package:project/logic/editable_text_field.dart';
import 'profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    final Profile profile =
        user != null ? UserDatabase.search(user.email!) : Profile.master();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            EditableTextField(
              initialText: profile.name,
              onSubmitted: (value) {
                setState(() {
                  profile.name = value;
                });
              },
            ),
            EditableTextField(
              initialText: profile.university,
              onSubmitted: (value) {
                setState(() {
                  profile.university = value;
                });
              },
            ),
            EditableTextField(
              initialText: profile.faculty,
              onSubmitted: (value) {
                setState(() {
                  profile.faculty = value;
                });
              },
            ),
            EditableTextField(
              initialText: profile.department,
              onSubmitted: (value) {
                setState(() {
                  profile.department = value;
                });
              },
            ),
            EditableTextField(
              initialText: profile.grade,
              onSubmitted: (value) {
                setState(() {
                  profile.grade = value;
                });
              },
            ),
            EditableTextField(
                editable: false, initialText: profile.birthdayFormatted),
            const SizedBox(
              height: 4,
            ),
            EditableTextField(
              initialText: profile.introduction,
              onSubmitted: (value) {
                setState(() {
                  profile.introduction = value;
                });
              },
            ),
            Image.network(profile.imageURL),
          ],
        ),
      ),
    );
  }
}
