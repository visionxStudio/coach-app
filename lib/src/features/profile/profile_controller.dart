import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/features/profile/data/like_comment_reply_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileController =
    ChangeNotifierProvider<ProfileController>((_) => ProfileController());

class ProfileController extends ChangeNotifier {
  bool showProfileImage = true;
  late ScrollController scrollController; // = ScrollController();

  //student profile check either profile checking user is current user or not
  bool isUser = true;
  bool showHideStudentProfileData = true;

  List<LikeCommentReplyModel> userLikeCommentList = [
    LikeCommentReplyModel(
      id: 1,
      isImage: '',
      name: 'Esther Howard',
      profile: ImageAsset.testprofile,
      likes: ["1", "2", "3"],
      reply: [
        LikeCommentReplyModel(
          id: 1,
          isImage: '',
          name: 'Esther Howard',
          profile: ImageAsset.testprofile,
          reply: [],
          status:
              'This could be due to them taking their time to release a stable version.',
          time: '26 min',
        ),
        LikeCommentReplyModel(
          id: 1,
          isImage: '',
          name: 'Esther Howard',
          profile: ImageAsset.testprofile,
          reply: [],
          status:
              'This could be due to them taking their time to release a stable version.',
          time: '26 min',
        )
      ],
      status:
          'This could be due to them taking their time to release a stable version.',
      time: '26 min',
    ),
    LikeCommentReplyModel(
      id: 1,
      isImage: '',
      name: 'Esther Howard',
      profile: ImageAsset.testprofile,
      likes: [
        "1",
      ],
      reply: [
        LikeCommentReplyModel(
          id: 1,
          isImage: '',
          name: 'Esther Howard',
          profile: ImageAsset.testprofile,
          reply: [],
          status:
              'This could be due to them taking their time to release a stable version.',
          time: '26 min',
        )
      ],
      status:
          'This could be due to them taking their time to release a stable version.',
      time: '26 min',
    ),
    LikeCommentReplyModel(
      id: 1,
      isImage: '',
      name: 'Esther Howard',
      profile: ImageAsset.testprofile,
      likes: ["3"],
      reply: [
        LikeCommentReplyModel(
          id: 1,
          isImage: '',
          name: 'Esther Howard',
          profile: ImageAsset.testprofile,
          reply: [],
          status:
              'This could be due to them taking their time to release a stable version.',
          time: '26 min',
        ),
        LikeCommentReplyModel(
          id: 1,
          isImage: '',
          name: 'Esther Howard',
          profile: ImageAsset.testprofile,
          reply: [],
          status:
              'This could be due to them taking their time to release a stable version.',
          time: '26 min',
        )
      ],
      status:
          'This could be due to them taking their time to release a stable version.',
      time: '26 min',
    ),
  ];

  void hideAndShowProfileImage(double pixel) {
    if (pixel > 70) {
      showProfileImage = false;
    } else {
      showProfileImage = true;
    }
    notifyListeners();
  }

  void changeProfileInformationHideShow(bool value) {
    showHideStudentProfileData = value;
    notifyListeners();
  }
}
