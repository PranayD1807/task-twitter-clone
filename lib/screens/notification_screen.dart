import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_twitter_clone/consts/app_assets.dart';
import 'package:task_twitter_clone/consts/app_color.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Widget> tabs = [
    const Tab(text: "All"),
    const Tab(text: "Verified"),
    const Tab(text: "Mentions"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScrollView(slivers: [
        SliverAppBar(
          foregroundColor: AppColor.black,
          snap: true,
          pinned: true,
          floating: true,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            labelColor: AppColor.black,
            tabs: tabs,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.gear),
            ),
          ],
          title: const Text("Notifications"),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              widget.scaffoldKey.currentState!.openDrawer();
            },
            icon: const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                AppAssets.profilePic,
              ),
            ),
          ),
        ),
        const SliverFillRemaining(
            child: TabBarView(
          children: [
            Center(child: Text("All Notifications")),
            Center(child: Text("Verified Notifications")),
            Center(child: Text("Mentions")),
          ],
        ))
      ]),
    );
  }
}
