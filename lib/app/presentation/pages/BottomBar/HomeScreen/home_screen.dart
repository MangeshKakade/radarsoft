import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/responsive_layout.dart';
import '../../../view_models/home_view_model.dart';
import '../../../widget/category_tab.dart';
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
    ResponsiveLayout().init(context);

    double blockSizeHorizontal = ResponsiveLayout.blockSizeHorizontal!;
    double blockSizeVertical = ResponsiveLayout.blockSizeVertical!;

    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, dd MMMM').format(now);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: blockSizeVertical * 5,
              left: blockSizeHorizontal * 5,
              right: blockSizeHorizontal * 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    SizedBox(width: blockSizeHorizontal * 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: blockSizeVertical * 2,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: blockSizeVertical),
                        Text(
                          'Kalyani Nagar Pune,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: blockSizeVertical * 1.5,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'MH IN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: blockSizeVertical * 1.5,
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
                      size: blockSizeVertical * 3,
                    ),
                    SizedBox(width: blockSizeHorizontal * 4),
                    Icon(
                      Icons.notifications_none_sharp,
                      color: Colors.grey,
                      size: blockSizeVertical * 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: blockSizeVertical * 2),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD3D3D3),
              ),
            ),
          ),
          SizedBox(height: blockSizeVertical * 2),
          Container(
            padding: EdgeInsets.only(
              left: blockSizeHorizontal * 3,
              right: blockSizeHorizontal * 3,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Browse by categories',
                      style: TextStyle(
                        color: const Color(0xFF001833),
                        fontSize: blockSizeVertical * 2.5,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: blockSizeVertical * 2),
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
                              blockSizeHorizontal: blockSizeHorizontal * 0.8,
                              blockSizeVertical: blockSizeVertical * 0.7,
                            ),
                            SizedBox(width: blockSizeHorizontal * 4),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: blockSizeVertical * 2),
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

