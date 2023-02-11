import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_twitter_clone/consts/app_assets.dart';
import 'package:task_twitter_clone/consts/app_color.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.gear),
            ),
          ],
          pinned: true,
          floating: true,
          foregroundColor: AppColor.black,
          title: const Text("Search Direct Messages"),
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
            child: Text("Messages"),
          ),
        )
      ],
    );
  }
}
