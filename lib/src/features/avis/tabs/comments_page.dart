import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/avis/data/comment_model.dart';
import 'package:digicoach/src/features/avis/widgets/comment_list.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Center(
            child: NormalText(
              comments.length.toString() + " avis",
              fontSize: 18.0,
            ),
          ),
          const HeightWidget(20.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final CommentModel comment = comments[index];
              return CommentList(
                image: comment.image,
                date: comment.date,
                rating: comment.rating,
                name: comment.name,
                comment: comment.comment,
              );
            },
          ),
        ],
      ),
    );
  }
}
