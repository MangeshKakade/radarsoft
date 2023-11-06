import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  const BottomBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.blockSizeHorizontal,
    required this.blockSizeVertical,
  });

  @override
  Widget build(BuildContext context) {
    const selectedColor = Colors.white;
    const unselectedColor = Colors.blueGrey;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(blockSizeHorizontal * 2),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(blockSizeHorizontal * 10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: blockSizeVertical * 4,
              color: selectedIndex == index ? selectedColor : unselectedColor,
            ),
            const SizedBox(width: 5),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: 0, height: 0),
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