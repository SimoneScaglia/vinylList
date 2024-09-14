import 'package:flutter/material.dart';
import 'package:vinyl_list/utils/app_colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const BottomNavBarWidget({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.add,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              return InkWell(
                onTap: () => widget.onItemSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _icons[index],
                      color: widget.currentIndex == index
                          ? AppColors.accentColor
                          : AppColors.secondaryColor,
                      size: 28,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.currentIndex == index
                            ? AppColors.accentColor
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
