import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_twitter_clone/consts/app_color.dart';
import 'package:task_twitter_clone/screens/home_screen.dart';
import 'package:task_twitter_clone/screens/messages_screen.dart';
import 'package:task_twitter_clone/screens/notification_screen.dart';
import 'package:task_twitter_clone/screens/search_screen.dart';
import 'package:task_twitter_clone/screens/happening_now_screen.dart';

// ignore: constant_identifier_names
enum PageType { Home, SEARCH, TRENDING, NOTIFICATION, MESSAGE }

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentPage = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        scaffoldKey: _key,
      ),
      SearchScreen(
        scaffoldKey: _key,
      ),
      HappeningNowScreen(
        scaffoldKey: _key,
      ),
      NotificationsScreen(
        scaffoldKey: _key,
      ),
      MessagesScreen(
        scaffoldKey: _key,
      ),
    ];
  }

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.houseChimney,
      ),
      label: "Home",
      activeIcon: FaIcon(
        FontAwesomeIcons.houseChimney,
      ),
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      label: "Search",
      activeIcon: FaIcon(
        FontAwesomeIcons.magnifyingGlass,
      ),
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.chartLine),
      label: "Happening Now",
      activeIcon: FaIcon(
        FontAwesomeIcons.arrowTrendUp,
      ),
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.bell),
      label: "Notification",
      activeIcon: FaIcon(
        FontAwesomeIcons.solidBell,
      ),
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.envelope),
      label: "Message",
      activeIcon: FaIcon(
        FontAwesomeIcons.solidEnvelope,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
      body: screens[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: navBarItems,
        currentIndex: currentPage,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: AppColor.black,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
