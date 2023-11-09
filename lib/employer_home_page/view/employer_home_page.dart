import 'package:check_in/add_organisation_page/view/add_organisation_page.dart';
import 'package:check_in/business_page/business_page.dart';
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
  EmployerHomePage({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          width: 250,
          child: SafeArea(
            child: ListView(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SideMenuItem(
                  name: "Settings",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFFD9D9D9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddOrganisationPage(),
                  ),
                );
              },
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
            onPressed: () {
              _key.currentState!.openDrawer();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: ListView(
              children: [
                ...statuses.map(
                  (status) => BusinessCheckInStatusCard(
                    status: status,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const BusinessPage();
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    super.key,
    required this.name,
    this.onTap,
  });

  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(),
          ),
        ),
        child: const Text(
          "Settings",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class BusinessCheckInStatusCard extends StatelessWidget {
  const BusinessCheckInStatusCard({
    super.key,
    required this.status,
    this.onTap,
  });

  final BusinessCheckInStatus status;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
