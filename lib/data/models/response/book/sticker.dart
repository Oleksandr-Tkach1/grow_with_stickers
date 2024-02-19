class Sticker {
  final String coverUrl;

  Sticker({
    required this.coverUrl,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) {
    return Sticker(
      coverUrl: json['cover_url'],
    );
  }
}