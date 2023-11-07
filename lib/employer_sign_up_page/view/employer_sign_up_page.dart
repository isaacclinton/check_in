import 'package:check_in/employer_sign_in_page/employer_sign_in_page.dart';
import 'package:check_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmployerSignUpPage extends StatelessWidget {
  const EmployerSignUpPage({super.key});

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
                    "EMPLOYER SIGN UP",
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
                  const SizedBox(height: 30),
                  const CustomTextField(
                    "confirm password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Already Registered?"),
                      const SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const EmployerSignInPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
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
                      "SIGN UP",
                      onPressed: () {},
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
