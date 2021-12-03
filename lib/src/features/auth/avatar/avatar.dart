import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class CreateAvatar extends StatelessWidget {
  const CreateAvatar(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.asset(
            image,
            height: 90.0,
            width: 90.0,
            fit: BoxFit.none,
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(45.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 4.37,
                offset: Offset(0, 4.37), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              color: kNavBackgroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
