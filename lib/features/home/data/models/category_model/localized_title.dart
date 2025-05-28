class LocalizedTitle {
  String en;
  String ar;

  LocalizedTitle({required this.en, required this.ar});

  factory LocalizedTitle.fromJson(Map<String, dynamic> json) {
    return LocalizedTitle(en: json['en'] as String, ar: json['ar'] as String);
  }

  Map<String, dynamic> toJson() => {'en': en, 'ar': ar};

  String toSlug() {
    // Remove any space if found and convert it to -
    return en.replaceAll(' ', '-').toLowerCase();
  }
}
