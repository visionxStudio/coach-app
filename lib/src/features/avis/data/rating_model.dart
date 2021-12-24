class RatingModel {
  final String type;
  final double rating;
  final int numberOfRatings;

  RatingModel({
    required this.type,
    required this.rating,
    required this.numberOfRatings,
  });
}

final List<RatingModel> ratingsList = [
  RatingModel(type: "avis_page.excellent", rating: 5, numberOfRatings: 5),
  RatingModel(type: "avis_page.well", rating: 4.3, numberOfRatings: 2),
  RatingModel(type: "avis_page.correct", rating: 3.4, numberOfRatings: 1),
  RatingModel(type: "avis_page.disappointing", rating: 2, numberOfRatings: 0),
  RatingModel(type: "avis_page.trash", rating: 1, numberOfRatings: 0),
];
