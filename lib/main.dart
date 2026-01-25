import 'package:collegesoftware/pages/home.dart';
import 'package:collegesoftware/pages/login.dart';
import 'package:collegesoftware/pages/resource_management.dart';
import 'package:collegesoftware/pages/events.dart';
import 'package:collegesoftware/pages/spectator.dart';
import 'package:collegesoftware/pages/organizer.dart';
import 'package:collegesoftware/pages/admin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String _userRole = 'spectator';

  void _setLoginState(bool state, {String role = 'spectator'}) {
    setState(() {
      _isLoggedIn = state;
      _userRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.blue.shade600,
        ),
      ),
      home: _isLoggedIn
          ? MainPage(onLogout: () => _setLoginState(false), userRole: _userRole)
          : LoginPage(onLogin: (role) => _setLoginState(true, role: role)),
    );
  }
}

class MainPage extends StatefulWidget {
  final VoidCallback onLogout;
  final String userRole;

  const MainPage({required this.onLogout, required this.userRole, super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _buildPages();
  }

  void _buildPages() {
    switch (widget.userRole) {
      case 'admin':
        _pages = [const AdminPage(), const HomePage()];
        break;
      case 'organizer':
        _pages = [const OrganizerPage(), const HomePage()];
        break;
      case 'spectator':
      default:
        _pages = [const SpectatorPage(), const HomePage(isSpectator: true)];
    }
  }

  String _getAppTitle() {
    switch (widget.userRole) {
      case 'admin':
        return 'Admin Dashboard';
      case 'organizer':
        return 'Organizer Dashboard';
      case 'spectator':
      default:
        return 'Campus Hub';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppTitle()),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade600, Colors.blue.shade800],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${widget.userRole.toUpperCase()} Account',
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Campus Hub',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            if (widget.userRole == 'spectator') ...[
              ListTile(
                leading: const Icon(Icons.visibility),
                title: const Text('Dashboard'),
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
            ] else if (widget.userRole == 'organizer') ...[
              ListTile(
                leading: const Icon(Icons.event_note),
                title: const Text('My Events'),
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
            ] else if (widget.userRole == 'admin') ...[
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Admin Panel'),
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
            ],
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                widget.onLogout();
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}