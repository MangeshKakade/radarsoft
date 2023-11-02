import 'package:flutter/material.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/profile_screen.dart';


import 'calendar_screen.dart';
import 'HomeScreen/home_scree.dart';
import 'message_screen.dart';



class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MessageScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              icon: Icons.maps_home_work_outlined,
              label: 'Home',
              index: 0,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            BottomBarItem(
              icon: Icons.chat_bubble_outline,
              label: 'Message',
              index: 1,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            BottomBarItem(
              icon: Icons.calendar_month_sharp,
              label: 'Calendar',
              index: 2,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            BottomBarItem(
              icon: Icons.person,
              label: 'Profile',
              index: 3,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  BottomBarItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const selectedColor = Colors.white;
    const unselectedColor = Colors.blueGrey;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 25,
              color: selectedIndex == index ? selectedColor : unselectedColor,
            ),
            const SizedBox(width: 5,),
            AnimatedCrossFade(
              firstChild: Container(width: 0, height: 0),
              secondChild: Text(
                label,
                style: const TextStyle(
                  color: selectedColor,
                ),
              ),
              crossFadeState: selectedIndex == index
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
