import 'package:project/packages.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Create Account"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home/profile'),
                child: const Text("Create Account")),
          ],
        ),
      ),
    );
  }
}
