import 'package:flutter/material.dart';

class BusinessCheckInStatus {
  const BusinessCheckInStatus({
    required this.name,
    required this.checkedIn,
    required this.totalEmployees,
  });

  final String name;
  final int checkedIn;
  final int totalEmployees;
}

const statuses = <BusinessCheckInStatus>[
  BusinessCheckInStatus(
    name: "RTI",
    checkedIn: 12,
    totalEmployees: 15,
  ),
  BusinessCheckInStatus(
    name: "Plan B",
    checkedIn: 13,
    totalEmployees: 20,
  ),
];

class EmployerHomePage extends StatelessWidget {
  const EmployerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              child: const Text(
                "Add Organisation",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
          leading: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 25,
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: ListView(
              children: [
                ...statuses.map(
                  (status) => BusinessCheckInStatusCard(status: status),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BusinessCheckInStatusCard extends StatelessWidget {
  const BusinessCheckInStatusCard({
    super.key,
    required this.status,
  });

  final BusinessCheckInStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF05BFDB),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "${status.checkedIn} out of ${status.totalEmployees} checked in",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
