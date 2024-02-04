import 'package:flutter/material.dart';
import 'package:push_up_counter/app/app.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Dashboard Page'),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pushDetailPage(context: context, id: '1');
              }, child: const Text('Go to Detail Page'),
            ),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pushSettingsPage(context: context);
              }, child: const Text('Go to Settings Page'),
            ),
          ],
        ),
      )
    );
  }
}
