import 'package:intl/intl.dart';

class PostModel {
  PostModel({
    this.date,
    this.description,
    this.imageUrl,
    this.id,
    this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    String description = json["excerpt"]["rendered"];
    description = Bidi.stripHtmlIfNeeded(description);
    String title = json["title"]["rendered"];
    title = Bidi.stripHtmlIfNeeded(title);

    return PostModel(
      id: json["id"].toString(),
      title: title,
      date: DateTime.tryParse(json["date"]),
      description: description,
      imageUrl: json["jetpack_featured_media_url"],
    );
  }

  final String? id;
  final String? title;
  final DateTime? date;
  final String? description;
  final String? imageUrl;
}
