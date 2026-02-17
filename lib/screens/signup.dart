import 'package:flutter/material.dart';
import 'package:train_app_2/screens/home.dart';
import 'package:train_app_2/services/auth.dart';

class SignUpTask extends StatefulWidget {
  const SignUpTask({super.key});

  @override
  State<SignUpTask> createState() => _SignUpTaskState();
}

class _SignUpTaskState extends State<SignUpTask> {
  TextEditingController emailtask = TextEditingController();
  TextEditingController passwordtask = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('Todo App'), centerTitle: true,automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailtask,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              controller: passwordtask,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 14),
            ElevatedButton(
  onPressed: () async {
    try {

      final res = await AuthTask().signup(
        emailtask.text,
        passwordtask.text,
      );

      if (res.user != null) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );

      }

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );

    }
  },
  child: Text('Create Account'),
),

            SizedBox(height: 14),
            Text('OR'),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back To Login'),
            ),
          ],
        ),
      ),
    );
  }
}
