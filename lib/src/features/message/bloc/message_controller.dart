import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/features/message/data/message_model.dart';
import 'package:digicoach/src/features/message/data/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageController =
    ChangeNotifierProvider<MessageController>((_) => MessageController());

class MessageController extends ChangeNotifier {
  TextEditingController searchTextController = TextEditingController();

  ///use to navigate either chat dashboard of conversation page
  bool isChatPage = false;
  bool isNavigateFromProfile = false;

  UserModel? chatData;

  void changeChatData(UserModel data) {
    chatData = data;
  }

  void changeChatPage({bool chatpage = false}) {
    isChatPage = chatpage;
    notifyListeners();
  }

  void profilePageNavigation({bool chatpage = false}) {
    isChatPage = chatpage;
    notifyListeners();
  }

//dummy data in case there is no data
  List<UserModel> userModelList = [
    UserModel(
        id: 1,
        name: "Bessie Cooper",
        lastmessage: 'Salut, comment tu vas ? je vais avoir 5 min de retard',
        msgTime: DateTime.now(),
        onlineStatus: false,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 4,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 2,
            seen: true,
          ),
        ]),
    UserModel(
        id: 2,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 4,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 1,
            seen: true,
          ),
        ]),
    UserModel(
        id: 3,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 4,
        name: "Greg Adams",
        lastmessage: 'Famers market is at Pasadena Highschool Saturday morning',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 5,
        name: "Bessie Cooper",
        lastmessage: 'Salut, comment tu vas ? je vais avoir 5 min de retard',
        msgTime: DateTime.now(),
        onlineStatus: false,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 6,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 7,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 8,
        name: "Greg Adams",
        lastmessage: 'Famers market is at Pasadena Highschool Saturday morning',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 9,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 10,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.testprofile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
  ];
}
