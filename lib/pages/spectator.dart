import 'package:flutter/material.dart';

class SpectatorPage extends StatelessWidget {
  const SpectatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.visibility, size: 80, color: Colors.blue.shade600),
            ),
            const SizedBox(height: 24),
            const Text(
              'Spectator Access',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'View campus events and resources',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _PermissionCard(
              icon: Icons.event,
              title: 'View Events',
              description: 'Browse all upcoming campus events',
              allowed: true,
            ),
            const SizedBox(height: 16),
            _PermissionCard(
              icon: Icons.library_books,
              title: 'View Resources',
              description: 'Access available campus resources',
              allowed: true,
            ),
            const SizedBox(height: 16),
            _PermissionCard(
              icon: Icons.edit,
              title: 'Create Events',
              description: 'Not available for spectators',
              allowed: false,
            ),
            const SizedBox(height: 16),
            _PermissionCard(
              icon: Icons.settings,
              title: 'Admin Settings',
              description: 'Not available for spectators',
              allowed: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool allowed;

  const _PermissionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.allowed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: allowed ? 2 : 0,
      color: allowed ? Colors.white : Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: allowed ? Colors.blue.shade100 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: allowed ? Colors.blue.shade600 : Colors.grey.shade500),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: allowed ? Colors.black : Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: allowed ? Colors.grey.shade600 : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              allowed ? Icons.check_circle : Icons.lock,
              color: allowed ? Colors.green : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
