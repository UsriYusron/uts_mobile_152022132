import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.person_outline, Icons.person, 'Biodata', 0),
          _buildNavItem(Icons.contacts_outlined, Icons.contacts, 'Kontak', 1),
          _buildNavItem(Icons.calculate_outlined, Icons.calculate, 'Kalkulator', 2),
          _buildNavItem(Icons.cloud_outlined, Icons.cloud, 'Cuaca', 3),
          _buildNavItem(Icons.article_outlined, Icons.article, 'Berita', 4),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade600,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(icon),
          if (selectedIndex == index)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              ),
            ),
        ],
      ),
      activeIcon: Icon(activeIcon),
      label: label,
    );
  }
}
