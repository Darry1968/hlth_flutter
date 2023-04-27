import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HlthFirebaseUser {
  HlthFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

HlthFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HlthFirebaseUser> hlthFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HlthFirebaseUser>(
      (user) {
        currentUser = HlthFirebaseUser(user);
        return currentUser!;
      },
    );
