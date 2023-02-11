import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:task_twitter_clone/api/api.dart';
import 'package:task_twitter_clone/consts/app_assets.dart';
import 'package:task_twitter_clone/consts/app_color.dart';
import 'package:task_twitter_clone/model/post.dart';
import 'package:task_twitter_clone/widgets/postview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const Tab(text: "For you"),
    const Tab(text: "Following"),
  ];

  ScrollController scrollController = ScrollController();
  // Lazy Scrolling
  static const _pageSize = 5;

  final PagingController<int, PostModel> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await Api.getPosts(_pageSize, pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(controller: scrollController, slivers: [
        SliverAppBar(
          snap: true,
          pinned: true,
          floating: true,
          bottom: TabBar(
            labelColor: AppColor.black,
            tabs: tabs,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          title: const SizedBox(
            height: 30,
            width: 30,
            child: Image(
              image: AssetImage(
                AppAssets.twitterLogo,
              ),
              fit: BoxFit.contain,
            ),
          ),
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
        SliverFillRemaining(
            child: TabBarView(
          children: [
            PostView(
              pagingController: _pagingController,
              controller: scrollController,
            ),
            const Center(child: Text("Following")),
          ],
        ))
      ]),
    );
  }
}
