import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:onboarding_screen/component/my_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullnameController = TextEditingController();

  final repasswordController = TextEditingController();

  createUserWithEmailAndPassword() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:emailController.text,
        password:passwordController.text
      );
      print("Success jubjub");
    }on FirebaseAuthException catch(e){
      print('Fail an jaa error code ${e.code}');
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 40, 50, 40),
        child: Form(
            child: Column(
          children: [
            const Spacer(),
            Text(
              "Welcome to our community.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              "\nTo get started, please provide your information and create an account.\n",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MytextField(
                controller: fullnameController,
                hintText: "Enter your name",
                obscureText: false,
                labelText: "Name"),
            const SizedBox(
              height: 20,
            ),
            MytextField(
              controller: emailController,
              labelText: "Email",
              obscureText: false,
              hintText: "Enter your email.",
            ),
            const SizedBox(
              height: 20,
            ),
            MytextField(
              controller: passwordController,
              labelText: "Password",
              obscureText: true,
              hintText: "Enter your password.",
            ),
            const SizedBox(
              height: 20,
            ),
            MytextField(
              controller: repasswordController,
              labelText: "Re-password",
              obscureText: true,
              hintText: "Enter your password again.",
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                onTap: createUserWithEmailAndPassword, hintText: "Sign up"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign in.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}
