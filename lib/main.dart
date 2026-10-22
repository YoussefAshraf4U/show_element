import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Hardcoded local data source (edit this list to change the items)
class Item {
  final String title;
  final String description;
  final IconData icon;

  const Item({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const List<Item> items = [
  Item(
    title: 'Design',
    description: 'Clean and modern user interfaces.',
    icon: Icons.palette_outlined,
  ),
  Item(
    title: 'Development',
    description: 'Fast and reliable cross-platform apps.',
    icon: Icons.code,
  ),
  Item(
    title: 'Testing',
    description: 'Making sure everything works smoothly.',
    icon: Icons.bug_report_outlined,
  ),
  Item(
    title: 'Deployment',
    description: 'Publishing your app to the stores.',
    icon: Icons.rocket_launch_outlined,
  ),
  Item(
    title: 'Support',
    description: 'Ongoing help after the launch.',
    icon: Icons.support_agent,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Display App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: colors.primaryContainer,
                child: Icon(item.icon, color: colors.primary),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(item.description),
              ),
            ),
          );
        },
      ),
    );
  }
}
