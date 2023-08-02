import 'package:project/packages.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Create Account"),
          ],
        ),
      ),
    );
  }
}
