import 'package:flutter/material.dart';

class Subscription {
  const Subscription({
    required this.name,
    required this.maxEmployees,
    required this.amount,
    required this.maxBusiness,
  });

  final String name;
  final int maxEmployees;
  final int maxBusiness;
  final double amount;
}

const yearlySubs = <Subscription>[
  Subscription(
    name: "Basic",
    maxEmployees: 10,
    amount: 7.99,
    maxBusiness: 1,
  ),
  Subscription(
    name: "Standard",
    maxEmployees: 49,
    amount: 29.99,
    maxBusiness: 4,
  ),
  Subscription(
    name: "Premium",
    maxEmployees: 250,
    amount: 79.99,
    maxBusiness: 10,
  ),
];
const monthlySubs = <Subscription>[
  Subscription(
    name: "Basic",
    maxEmployees: 10,
    amount: 12,
    maxBusiness: 1,
  ),
  Subscription(
    name: "Standard",
    maxEmployees: 49,
    amount: 40,
    maxBusiness: 4,
  ),
  Subscription(
    name: "Premium",
    maxEmployees: 250,
    amount: 100,
    maxBusiness: 10,
  ),
];

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                const Text(
                  "SUBSCRIBE",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: const TabBar(
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Color(0xFF2F66F3),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: -8),
                        indicatorWeight: 3,
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        tabs: [
                          Tab(text: "Yearly"),
                          Tab(text: "Monthly"),
                        ],
                      ),
                      body: TabBarView(
                        children: [
                          ...[yearlySubs, monthlySubs].map(
                            (subs) => ListView(
                              children: [
                                ...subs.map(
                                  (sub) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 3),
                                    child: SubscriptionCard(
                                      subscription: sub,
                                      onTap: (){},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.subscription,
    this.onTap,
  });

  final void Function()? onTap;
  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 170,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
            color: Color(0xFF2F66F3),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subscription.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "\$${subscription.amount}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: " p.m",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Wrap(
              direction: Axis.vertical,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Maximum ${subscription.maxEmployees} employees",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Maximum ${subscription.maxBusiness} business",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
