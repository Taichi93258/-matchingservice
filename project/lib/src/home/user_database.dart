import 'profile.dart';

class UserDatabase {
  // TODO: Implement the interaction with database (maybe using aws)
  static Profile search(String email) {
    return Profile.master();
  }

  static Profile nextPerson() {
    return search("");
  }
}
