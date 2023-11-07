import 'package:check_in/employer_sign_up_page/view/employer_sign_up_page.dart';
import 'package:check_in/verification_page/verification_page.dart';
import 'package:check_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmployerSignInPage extends StatelessWidget {
  const EmployerSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "EMPLOYER SIGN IN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CustomTextField("email"),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    "password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Not Registered?"),
                      const SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const EmployerSignUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF2F66F3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      "SIGN IN",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const VerificationPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
