import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String id = 'registerScreen';
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset('assets/images/scholar.png'),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontFamily: 'pacifico',
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const Row(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              hintText: 'Email',
            ),
            CustomTextField(
              onChanged: (data) {
                password = data;
              },
              hintText: 'Password',
            ),
            CustomButton(
              onTap: () async {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email!, password: password!);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The password provided is too weak.')));
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists for that email.')));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));
              },
              buttonText: 'REGISTER',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Login',
                    style: TextStyle(
                      color: Color(0xffC7EDE6),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
