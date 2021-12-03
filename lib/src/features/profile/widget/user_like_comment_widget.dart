import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/profile/coach_profile_page.dart';
import 'package:digicoach/src/features/profile/data/like_comment_reply_model.dart';
import 'package:flutter/material.dart';

class UserCommentAndReplytWidget extends StatelessWidget {
  final LikeCommentReplyModel model;
  final int index;
  final bool subcommet;
  final String like;
  final String reply;
  const UserCommentAndReplytWidget({
    Key? key,
    required this.index,
    required this.model,
    required this.subcommet,
    this.like = "Like",
    this.reply = "Reply",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          if (subcommet) const Divider(),
          Row(
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    model.profile,
                  )),
              const WidthWidget(10),
              NormalText(
                model.name,
                isBold: true,
              ),
              const WidthWidget(10),
              NormalText(
                model.time,
                color: kMessageTimeColor,
                fontSize: kDefaultFontSize - 4,
              )
            ],
          ),
          const HeightWidget(10),
          NormalText(
            model.status,
            fontSize: kDefaultFontSize - 4,
          ),
          const HeightWidget(10),
          Column(
            children: [
              Row(
                children: [
                  model.likes != null
                      ? NormalText(
                          "${model.likes!.length} $like",
                          fontSize: kDefaultFontSize - 4,
                        )
                      : NormalText(
                          like,
                          fontSize: kDefaultFontSize - 4,
                        ),
                  const WidthWidget(10),
                  Image.asset(
                    ImageAsset.reply,
                    height: kDefaultFontSize - 4,
                  ),
                  const WidthWidget(10),
                  NormalText(
                    reply,
                    fontSize: kDefaultFontSize - 4,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.thumb_up_outlined,
                      size: 25,
                    ),
                  )
                ],
              ),

              //sub reply
              if (model.reply.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.reply.length,
                      itemBuilder: (context, index) {
                        LikeCommentReplyModel replymodel = model.reply[index];
                        return SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              const WidthWidget(5),
                              Column(
                                children: const [
                                  DotWidget(),
                                  DotWidget(),
                                  DotWidget(),
                                  DotWidget(),
                                ],
                              ),
                              const WidthWidget(10),
                              Expanded(
                                child: UserCommentAndReplytWidget(
                                  index: index,
                                  model: replymodel,
                                  subcommet: true,
                                  like: like,
                                  reply: reply,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
            ],
          )
        ],
      ),
    );
  }
}
