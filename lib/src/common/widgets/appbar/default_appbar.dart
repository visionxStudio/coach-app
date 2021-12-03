import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50.0,
      elevation: 0.0,
      backgroundColor: kWhiteColor,
      leading: InkWell(
        onTap: () {
          context.router.pop();
        },
        splashColor: kWhiteColor,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 8.0),
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 10.0,
            width: 10.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor),
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: kWhiteColor,
                size: 18.0,
              ),
            ),
          ),
        ),
      ),
      title: NormalText(
        title,
        color: kPrimaryColor,
        fontSize: 20.0,
        isBold: true,
      ),
      centerTitle: true,
    );
  }
}
