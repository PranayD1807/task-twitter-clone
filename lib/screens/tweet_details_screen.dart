import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_twitter_clone/consts/app_color.dart';
import 'package:task_twitter_clone/model/post.dart';

class TweetDetailsScreen extends StatelessWidget {
  const TweetDetailsScreen({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColor.black,
        title: const Text("Tweet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://source.unsplash.com/random"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      post.title ?? "Title Not Found",
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (post.description != null)
                Text(
                  post.description!,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              const SizedBox(height: 10),
              if (post.imageUrl != null)
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(post.imageUrl!,
                      errorBuilder: (context, error, stackTrace) {
                    return const SizedBox();
                  }, loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  }),
                ),
              const SizedBox(height: 10),
              Text(
                DateFormat.jm()
                    .addPattern(" - ")
                    .add_yMd()
                    .format(post.date ?? DateTime.now()),
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
