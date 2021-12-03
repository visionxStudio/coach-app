import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/home/widgets/search_input_fiel_widget.dart';
import 'package:digicoach/src/features/message/bloc/message_controller.dart';
import 'package:digicoach/src/features/message/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageHomeDashBoardWidget extends ConsumerWidget {
  const MessageHomeDashBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(messageController);
    List<UserModel> gridlist = [];

    gridlist = controller.userModelList.length > 9
        ? controller.userModelList.take(9).toList()
        : controller.userModelList.toList();

    return Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding / 2,
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2),
        child: Column(children: [
          const SearchInputFieldWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    // childAspectRatio: (2 / 1),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 1,
                    padding: const EdgeInsets.all(5.0),
                    children: gridlist.asMap().entries.map((d) {
                      UserModel data = d.value;

                      return InkWell(
                          onTap: () {
                            controller.changeChatData(data);
                            controller.changeChatPage(chatpage: true);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                CircleAvatar(
                                    radius: 38,
                                    backgroundImage: AssetImage(data.profile)),
                                const HeightWidget(.01),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (data.onlineStatus)
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                kIndicatorColor3,
                                                kIndicatorColor1
                                              ],
                                            )),
                                      ),
                                    const WidthWidget(.01),
                                    Flexible(
                                        child: NormalText(
                                      data.name,
                                      fontSize: 13,
                                      maxline: 1,
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    }).toList(),
                  ),
                  const HeightWidget(15),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        UserModel um = controller.userModelList[index];
                        return ListTile(
                          onTap: () {
                            controller.changeChatData(um);
                            controller.changeChatPage(chatpage: true);
                          },
                          leading: CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage(um.profile),
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: NormalText(
                                  um.name,
                                  isBold: true,
                                ),
                              ),
                              const NormalText(
                                "5:00 PM",
                                color: kSubtitleColor,
                                fontSize: 15,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: kGreyColor,
                                size: 14,
                              )
                            ],
                          ),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeightWidget(.001),
                              NormalText(
                                um.lastmessage,
                                color: kSubtitleColor,
                                maxline: 2,
                                fontSize: 15,
                              ),
                              const Divider(
                                color: kLightGreyColor,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controller.userModelList.length)
                ],
              ),
            ),
          ),
        ]));
  }
}
