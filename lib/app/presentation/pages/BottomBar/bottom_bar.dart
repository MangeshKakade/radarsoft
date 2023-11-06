import 'package:flutter/material.dart';
import 'package:radarsofttask/app/presentation/pages/BottomBar/profile_screen.dart';
import '../../../utils/responsive_layout.dart';
import '../../view_models/home_view_model.dart';
import '../../widget/bottom_bar_item.dart';
import 'calendar_screen.dart';
import 'HomeScreen/home_screen.dart';
import 'message_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(viewModel: HomeViewModel()),
    const MessageScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: blockSizeVertical * 9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(blockSizeHorizontal * 6),
            topRight: Radius.circular(blockSizeHorizontal * 6),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: blockSizeHorizontal,
              blurRadius: blockSizeHorizontal * 2,
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
              blockSizeHorizontal: blockSizeHorizontal,
              blockSizeVertical: blockSizeVertical,
            ),
            BottomBarItem(
              icon: Icons.chat_bubble_outline,
              label: 'Message',
              index: 1,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
              blockSizeHorizontal: blockSizeHorizontal,
              blockSizeVertical: blockSizeVertical,
            ),
            BottomBarItem(
              icon: Icons.calendar_month_sharp,
              label: 'Calendar',
              index: 2,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
              blockSizeHorizontal: blockSizeHorizontal,
              blockSizeVertical: blockSizeVertical,
            ),
            BottomBarItem(
              icon: Icons.person,
              label: 'Profile',
              index: 3,
              selectedIndex: _selectedIndex,
              onTap: _onItemTapped,
              blockSizeHorizontal: blockSizeHorizontal,
              blockSizeVertical: blockSizeVertical,
            ),
          ],
        ),
      ),
    );
  }
}


