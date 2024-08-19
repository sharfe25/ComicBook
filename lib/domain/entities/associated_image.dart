class AssociatedImage {
  final String originalUrl;
  final int id;
  final String? caption;
  final String imageTags;

  AssociatedImage({
    required this.originalUrl,
    required this.id,
    this.caption,
    required this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) {
    return AssociatedImage(
      originalUrl: json['original_url'],
      id: json['id'],
      caption: json['caption'],
      imageTags: json['image_tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original_url': originalUrl,
      'id': id,
      'caption': caption,
      'image_tags': imageTags,
    };
  }
}
