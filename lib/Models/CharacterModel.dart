import 'package:equatable/equatable.dart';


class Character extends Equatable {
  final String imageUrl;
  final String title;
  final String description;

  Character({
    this.imageUrl = '',
    this.title = '',
    this.description = '',
  });

  Character copyWith({
    String? imageUrl,
    String? title,
    String? description,
  }) {
    return Character(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'imageUrl': imageUrl});
    result.addAll({'title': title});
    result.addAll({'description': description});

    return result;
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    String result = json['Result'] ?? '';
    String text = json['Text'] ?? '';

    return Character(
      imageUrl: json['imageUrl'] ?? '',
      title: json['title'] ?? '',
      description:json['description'] ?? '',
    );
  }


  @override
  String toString() {
    return 'Character(imageUrl: $imageUrl, title: $title, description: $description)';
  }

  @override
  List<Object> get props => [imageUrl, title, description];
}
