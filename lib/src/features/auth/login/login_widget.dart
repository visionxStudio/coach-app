// Social icons Widgets
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:flutter/material.dart';

/// using [BuildSocialSignup] provides sign up with social platforms like
/// twitter, facebook, apple and google
class BuildSocialSignup extends StatelessWidget {
  const BuildSocialSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Login with twitter
        _BuildSocialLogo(imageUrl: IconAsset.twitterlogo, ontap: () {}),
        // Login with facebook
        _BuildSocialLogo(imageUrl: IconAsset.facebookLogo, ontap: () {}),
        // Login with apple
        _BuildSocialLogo(imageUrl: IconAsset.appleLogo, ontap: () {}),
        // Login with google
        _BuildSocialLogo(imageUrl: IconAsset.googleLogo, ontap: () {}),
      ],
    );
  }
}

class _BuildSocialLogo extends StatelessWidget {
  const _BuildSocialLogo({
    Key? key,
    required this.imageUrl,
    required this.ontap,
  }) : super(key: key);

  final String imageUrl;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff12121D).withOpacity(0.1)),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: GestureDetector(
          onTap: ontap,
          child: Image.asset(
            imageUrl,
            height: 30.0,
            width: 30.0,
          ),
        ),
      ),
    );
  }
}
