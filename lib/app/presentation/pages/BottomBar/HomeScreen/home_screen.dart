import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../view_models/home_view_model.dart';
import 'CategoryTabScreens/all_event.dart';
import 'CategoryTabScreens/computer_screen.dart';
import 'CategoryTabScreens/startup_screen.dart';
import 'CategoryTabScreens/technolody_screen.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int selectedIndex = 0;
  List<String> categories = ["All events", "Startup", "Technology", "Computer"];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    widget.viewModel.categorySelectionBloc.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, dd MMMM').format(now);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Kalyani Nagar Pune,',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'MH IN',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(width: 24),
                    Icon(
                      Icons.notifications_none_sharp,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD3D3D3),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Browse by categories',
                      style: TextStyle(
                        color: const Color(0xFF001833),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int index = 0; index < categories.length; index++)
                        Row(
                          children: [
                            CategoryTab(
                              text: categories[index],
                              isSelected: index == selectedIndex,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                pageController.jumpToPage(index);
                              },
                            ),
                            SizedBox(width: 15), // Add space between tab buttons
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                const AllEvent(),
                const StartUpScreen(),
                const TechnologyScreen(),
                const ComputerScreen(),
              ],
              onPageChanged: (index) {
                widget.viewModel.categorySelectionBloc.setSelectedCategory(widget.viewModel.categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color(0xFF004999);
    final unselectedColor = const Color(0xFF8C8C8C);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 108,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          border: Border.all(
            width: 0.80,
            color: isSelected ? selectedColor : unselectedColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : unselectedColor,
              fontSize: 15,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

