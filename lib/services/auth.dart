import 'package:supabase_flutter/supabase_flutter.dart';

class AuthTask {
  final auth = Supabase.instance.client.auth;
 Future signup(String email, String password) async {
    return await auth.signUp(password: password, email: email);
  }

 Future login(String email, String password) async {
    return await auth.signInWithPassword(password: password, email: email);
  }

 Future signout() async {
    await auth.signOut();
  }
}
