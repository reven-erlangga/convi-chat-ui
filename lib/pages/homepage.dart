import 'package:bottom_bar/bottom_bar.dart';
import 'package:convi/pages/chats/chats.dart';
import 'package:flutter/material.dart';
import 'package:convi/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          ChatPage(),
          Container(color: Colors.red),
          Container(color: Colors.greenAccent.shade700),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.message),
            title: Text('Chats'),
            activeColor: blueColor,
          ),
          BottomBarItem(
            icon: Icon(Icons.group_work),
            title: Text('Channel'),
            activeColor: orangeColor,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: purpleColor,
          ),
        ],
      ),
    );
  }
}
