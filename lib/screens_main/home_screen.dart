import 'package:flutter/material.dart';
import 'package:flutter_ui/screens_coffee_app/dashboard.dart';
import 'package:flutter_ui/screens_groceries_app/groceries_home_screen.dart';
import 'package:flutter_ui/screens_onboarding_example/onboarding_main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                child: Text('Coffee')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroceriesHomeScreen()),
                  );
                },
                child: Text('Groceries shopping')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingMainScreen()),
                  );
                },
                child: Text('Onboarding example')),
          ],
        ),
      ),
    );
  }
}
