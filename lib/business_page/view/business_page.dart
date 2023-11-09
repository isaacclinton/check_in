import 'package:check_in/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final class EmployeeStatus {
  const EmployeeStatus({
    required this.name,
    this.timeCheckedIn,
    this.avatarUrl,
  });

  final String name;
  final DateTime? timeCheckedIn;
  final String? avatarUrl;
}

final statuses = <EmployeeStatus>[
  EmployeeStatus(
      name: "Mitchelle",
      timeCheckedIn: DateTime.now().copyWith(
        hour: 9,
        minute: 30,
      )),
  const EmployeeStatus(
    name: "Juma",
    timeCheckedIn: null,
  ),
];

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.white,
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
              ),
            ),
          ],
          title: const Text("RTI Business"),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  "Add Employee",
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ...statuses.map((status) => EmployeeStatusCard(status))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeStatusCard extends StatelessWidget {
  const EmployeeStatusCard(
    this.status, {
    super.key,
  });

  final EmployeeStatus status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFB4DBFF),
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.4,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    status.checkedInText,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on EmployeeStatus {
  String get checkedInText {
    if (timeCheckedIn == null) {
      return "Not checked In";
    }
    final formatter = DateFormat('jm');
    return "Checked in at ${formatter.format(timeCheckedIn!).toLowerCase()}";
  }
}
