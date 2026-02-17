import 'package:flutter/material.dart';
import 'package:train_app_2/screens/home.dart';
import 'package:train_app_2/screens/signup.dart';
import 'package:train_app_2/services/auth.dart';

class LoginTask extends StatefulWidget {
  const LoginTask({super.key});

  @override
  State<LoginTask> createState() => _LoginTaskState();
}

class _LoginTaskState extends State<LoginTask> {
  TextEditingController emailtask = TextEditingController();
  TextEditingController passwordtask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailtask,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              controller: passwordtask,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: () async {
                try {
                  await AuthTask().login(emailtask.text, passwordtask.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 14),
            Text('OR'),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpTask()),
                );
              },
              child: Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
