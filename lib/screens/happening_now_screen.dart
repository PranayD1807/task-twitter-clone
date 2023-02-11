import 'package:flutter/material.dart';
import 'package:task_twitter_clone/consts/app_assets.dart';
import 'package:task_twitter_clone/consts/app_color.dart';

class HappeningNowScreen extends StatelessWidget {
  const HappeningNowScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          pinned: true,
          floating: true,
          foregroundColor: AppColor.black,
          title: const Text("Twitter"),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
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
          child: Center(
            child: Text("Happening Now!"),
          ),
        )
      ],
    );
  }
}
