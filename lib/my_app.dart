import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/presentation/favorite/screens/favorite_screen.dart';
import 'package:technaureus/presentation/home/screens/home_screen.dart';
import 'package:technaureus/presentation/user/screens/user_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    Container(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            _buildBottomNavItem(Icons.home, 'Home', 0),
            _buildBottomNavItem(Icons.favorite, 'Wishlist', 1),
            _buildBottomNavItem(Icons.message, 'Messages', 2),
            _buildBottomNavItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8.0),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color.fromARGB(255, 212, 53, 0),
                shape: BoxShape.circle)
            : null,
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      label: label,
    );
  }
}
