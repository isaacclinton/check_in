import 'package:check_in/widgets/custom_button.dart';
import 'package:check_in/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddOrganisationPage extends StatelessWidget {
  const AddOrganisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 28,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        elevation: 0,
        title: const Text("Add Organisation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CustomTextField("Name"),
            const SizedBox(height: 40),
            const CustomTextField("Location"),
            const SizedBox(height: 40),
            CustomButton(
              "ADD",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
