import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  const CategoryTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.blockSizeHorizontal,
    required this.blockSizeVertical,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color(0xFF004999);
    final unselectedColor = const Color(0xFF8C8C8C);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: blockSizeHorizontal * 27,
        height: blockSizeVertical * 7,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          border: Border.all(
            width: blockSizeHorizontal * 0.15,
            color: isSelected ? selectedColor : unselectedColor,
          ),
          borderRadius: BorderRadius.circular(blockSizeHorizontal * 2),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : unselectedColor,
              fontSize: blockSizeVertical * 2.5,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
