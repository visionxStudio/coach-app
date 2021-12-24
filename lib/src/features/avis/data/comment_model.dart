import 'package:digicoach/src/common/constants/asset_image_link.dart';

class CommentModel {
  final String name;
  final String comment;
  final double rating;
  final String date;
  final String image;

  CommentModel({
    required this.name,
    required this.comment,
    required this.rating,
    required this.date,
    required this.image,
  });
}

final List<CommentModel> comments = [
  CommentModel(
    name: "Maude Hall",
    comment: "Super séance je recommande !",
    date: "6 novembre 2021",
    image: ImageAsset.avatar1,
    rating: 5,
  ),
  CommentModel(
    name: "Pierre Damien",
    comment:
        "Coach vraiment à l’écoute, j’ai passé un super moment avec Pierre. Merci !",
    date: "25 Août 2021",
    image: ImageAsset.avatar2,
    rating: 2.5,
  ),
];
