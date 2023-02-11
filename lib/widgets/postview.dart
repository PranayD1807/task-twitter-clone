import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_twitter_clone/model/post.dart';
import 'package:task_twitter_clone/screens/tweet_details_screen.dart';

class PostView extends StatelessWidget {
  const PostView({
    Key? key,
    required PagingController<int, PostModel> pagingController,
    required this.controller,
  })  : _pagingController = pagingController,
        super(key: key);

  final PagingController<int, PostModel> _pagingController;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, PostModel>.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      scrollController: controller,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<PostModel>(
        itemBuilder: (context, item, index) => PostItem(
          post: item,
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => TweetDetailsScreen(post: post)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/random"),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    post.title ?? "Title Not Found",
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    post.description ?? "Description Not Found",
                    maxLines: 7,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  if (post.imageUrl != null)
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Image.network(
                          post.imageUrl!,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
