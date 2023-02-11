import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_twitter_clone/consts/app_assets.dart';
import 'package:task_twitter_clone/consts/app_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> tabs = [
    const Tab(text: "For you"),
    const Tab(text: "Trending"),
    const Tab(text: "News"),
    const Tab(text: "Sports"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
          title: const Text("Search"),
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
            Center(child: Text("For you")),
            Center(child: Text("Trending")),
            Center(child: Text("News")),
            Center(child: Text("Sports"))
          ],
        ))
      ]),
    );
  }
}
