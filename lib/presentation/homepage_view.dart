import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/presentation/home/home_view.dart';
import 'package:helpdesk/presentation/ticket/ticket_view.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const HomeView(), const TicketView()];

  void _onTabTapped(int index) {
    if (_currentIndex == index) return; // prevent rebuild unnecessary
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12,
      unselectedFontSize: 11,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number_outlined),
          activeIcon: Icon(Icons.confirmation_number),
          label: 'Ticket',
        ),
      ],
    );
  }
}
