import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: _screens[_selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white, // Keep it white
                  items: [
                    _buildBottomNavItem(Icons.home_outlined, 'Home', 0),
                    _buildBottomNavItem(Icons.favorite_border, 'Wishlist', 1),
                    _buildBottomNavItem(
                        Icons.messenger_outline_sharp, 'Messages', 2),
                    _buildBottomNavItem(
                        Icons.person_outline_rounded, 'Profile', 3),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: isSelected
          ? _buildSelectedIcon(icon)
          : Icon(
              icon,
              color: Colors.black,
              size: 24.sp,
            ),
      label: label,
    );
  }

  Widget _buildSelectedIcon(IconData icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 8,
          shape: CircleBorder(),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 212, 53, 0),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.sp),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
