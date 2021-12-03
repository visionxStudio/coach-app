class CoachStudentModel {
  final String id;
  final String name;
  final String profile;
  final String title;
  final String address;
  final String coachtype;
  final String coachingImage;
  final int heart;
  final int comment;
  final String? interest;
  final double averageRating;
  final double fee;
  final List<String> participant;
  CoachStudentModel({
    required this.id,
    required this.name,
    required this.profile,
    required this.title,
    required this.address,
    required this.coachtype,
    required this.heart,
    required this.comment,
    required this.averageRating,
    required this.fee,
    required this.participant,
    required this.coachingImage,
    this.interest,
  });
}
