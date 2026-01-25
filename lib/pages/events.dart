import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final List<Map<String, String>> events = [
    {'title': 'Tech Seminar', 'date': 'Dec 15, 2024', 'location': 'Auditorium'},
    {'title': 'Sports Day', 'date': 'Dec 20, 2024', 'location': 'Sports Complex'},
    {'title': 'Cultural Fest', 'date': 'Dec 25, 2024', 'location': 'Campus Ground'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming Events',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _showCreateEventDialog(),
            icon: const Icon(Icons.add),
            label: const Text('Create Event'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.event),
                    title: Text(events[index]['title']!),
                    subtitle: Text('${events[index]['date']!}\n${events[index]['location']!}'),
                    isThreeLine: true,
                    onTap: () => _showEventDetails(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateEventDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Event Title')),
            TextField(decoration: const InputDecoration(labelText: 'Date')),
            TextField(decoration: const InputDecoration(labelText: 'Location')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Create')),
        ],
      ),
    );
  }

  void _showEventDetails(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(events[index]['title']!),
        content: Text('Date: ${events[index]['date']!}\nLocation: ${events[index]['location']!}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}
