import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const Navbar({super.key,
  required this.selectedIndex,
  required this.onItemTapped});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Tcolor.primaryColor1,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Movie', 0),
          _buildNavItem(Icons.star, 'Popular', 1),
          _buildNavItem(Icons.bookmark, 'Bookmark', 2),
        ],
      ),
    );
  }
    
  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = index == widget.selectedIndex;

    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Tcolor.primaryColor2 : Colors.black,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Tcolor.primaryColor2 : Colors.black,
            ),
          ),
        ],
      ),
    );

  }
}