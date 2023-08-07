import 'package:project/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/src/home/user_database.dart';
import 'package:project/src/home/editable_text_field.dart';
import 'profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int editingFlag = 0;

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    final List<String> profile = user != null
        ? UserDatabase.search(user.email!).indexed
        : Profile.master().indexed;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                children: List.generate(Profile.dataLength, (index) {
              if (index == Profile.getId('imageURL')) {
                return Image.network(
                    'https://img.freepik.com/free-photo/orthodontics-dental-care-and-stomatology-concept-close-up-of-gloomy-and-sad-cute-asian-guy-sulking-looking-upset-at-camera-feeling-lonely-or-distressed-standing-white-background-in-bad-mood_1258-57140.jpg?size=626&ext=jpg');
              } else if (index == Profile.getId('name') ||
                  index == Profile.getId('introduction')) {
                return EditableTextField(
                  initialText: profile[index],
                  multiline: index == Profile.getId('introduction'),
                  onSubmitted: (value) {
                    setState(() {
                      profile[index] = value;
                      editingFlag = -1;
                    });
                  },
                  isEditing: editingFlag == index,
                  onFocused: () {
                    infoLog('onFocused: $index');
                    setState(() {
                      editingFlag = index;
                    });
                    infoLog('editingFlag: $editingFlag');
                    infoLog('isEditing: ${editingFlag == index} at $index');
                  },
                );
              } else {
                return EditableTextField(
                  initialText: profile[index],
                  editable: false,
                );
              }
            }))));
  }
}
