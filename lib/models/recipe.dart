class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({required this.name, required this.images, required this.rating, required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    // Handle the case where data might be missing
    String name = json['name'] as String;
    String images = json['images'][0]['hostedLargeUrl'] as String;
    double rating = json['rating'] as double;
    String totalTime = json['totalTime'] as String;

    //  You can add checks here to throw exceptions or provide defaults if data is missing

    return Recipe(
        name: name,
        images: images,
        rating: rating,
        totalTime: totalTime);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}

