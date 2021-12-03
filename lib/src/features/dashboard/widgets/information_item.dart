import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  final String image;
  final String data;
  final String title;
  final String color;
  const InformationItem(
      {Key? key,
      required this.image,
      required this.data,
      required this.title,
      required this.color})
      : super(key: key);

  Color colorConvert(String color) {
    Color backgroundColor = Colors.white;
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      backgroundColor = Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      backgroundColor = Color(int.parse("0x" + color));
    }
    return backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 2),
            spreadRadius: 0,
            color: const Color(0xff000000).withOpacity(0.25),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: const Color(0xffBDBDBD),
                fontSize: _height > 700 ? 16.0 : 12.0,
                overflow: TextOverflow.fade,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ),
          ),
          Row(
            children: [
              Container(
                height: _height > 700 ? 50.0 : 40,
                width: _height > 700 ? 50.0 : 40.0,
                decoration: BoxDecoration(
                  color: colorConvert(color),
                  borderRadius: BorderRadius.circular(500.0),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    height: 25.0,
                    width: 25.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                data,
                style: TextStyle(
                  color: const Color(0xff4F3A57),
                  fontSize: _height > 700 ? 28.0 : 20.0,
                  overflow: TextOverflow.fade,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
