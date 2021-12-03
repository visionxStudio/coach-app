import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class BottomPageCountWidget extends StatelessWidget {
  const BottomPageCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NormalText("Pages"),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                size: kDefaultFontSize - 2,
              )),
          const NormalText("1"),
          const WidthWidget(5),
          const NormalText("2"),
          const WidthWidget(5),
          const NormalText(
            "3",
            color: kWhiteColor,
          ),
          const WidthWidget(5),
          const NormalText("..."),
          const WidthWidget(5),
          const NormalText("9"),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: kDefaultFontSize - 2,
              )),
        ],
      ),
    );
  }
}
