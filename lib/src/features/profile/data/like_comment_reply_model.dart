class LikeCommentReplyModel {
  final int id;
  final String profile;
  final String name;
  final String time;
  final String status;
  final String isImage;
  final List<String>? likes;
  final List<LikeCommentReplyModel> reply;
  LikeCommentReplyModel({
    required this.id,
    required this.profile,
    required this.name,
    required this.time,
    required this.status,
    required this.isImage,
    this.likes,
    required this.reply,
  });
}
