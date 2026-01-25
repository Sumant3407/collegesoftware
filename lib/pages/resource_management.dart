import 'package:flutter/material.dart';

class ResourceManagementPage extends StatefulWidget {
  const ResourceManagementPage({super.key});

  @override
  State<ResourceManagementPage> createState() => _ResourceManagementPageState();
}

class _ResourceManagementPageState extends State<ResourceManagementPage> {
  final List<Map<String, String>> resources = [
    {'name': 'Library', 'location': 'Building A', 'status': 'Available'},
    {'name': 'Lab 1', 'location': 'Building B', 'status': 'In Use'},
    {'name': 'Cafeteria', 'location': 'Building C', 'status': 'Available'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Campus Resources',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _showAddResourceDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Add Resource'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: resources.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(resources[index]['name']!),
                    subtitle: Text(resources[index]['location']!),
                    trailing: Chip(
                      label: Text(resources[index]['status']!),
                      backgroundColor: resources[index]['status'] == 'Available'
                          ? Colors.green
                          : Colors.orange,
                    ),
                    onTap: () => _showResourceDetails(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddResourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Resource'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Resource Name')),
            TextField(decoration: const InputDecoration(labelText: 'Location')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Add')),
        ],
      ),
    );
  }

  void _showResourceDetails(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(resources[index]['name']!),
        content: Text('Location: ${resources[index]['location']!}\nStatus: ${resources[index]['status']!}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}
