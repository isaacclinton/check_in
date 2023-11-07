import 'package:check_in/employer_sign_in_page/view/employer_sign_in_page.dart';
import 'package:check_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GeneralSignPage extends StatelessWidget {
  const GeneralSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Continue as an...",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  "Employer",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EmployerSignInPage(),
                      ),
                    );
                  },
                ),
                CustomButton(
                  "Employee",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
