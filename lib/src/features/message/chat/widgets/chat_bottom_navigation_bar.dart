// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class BottomChatNavWidget extends StatelessWidget {
//   const BottomChatNavWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: OvalTopBorderClipper(),
//       child: SizedBox(
//         height: 120,
//         child: Obx(
//           () => Theme(
//             data: Theme.of(context).copyWith(
//               // sets the background color of the `BottomNavigationBar`
//               canvasColor: homeController.isChatPage.value
//                   ? kWhiteColor
//                   : kLightestGreyColor.withOpacity(.4),
//             ),
//             child: BottomNavigationBar(
//               onTap: (newIndex) => homeController.index.value = newIndex,
//               currentIndex: homeController.index.value,
//               elevation: 0,
//               items: [
//                 bottomNavigationOne(homeController.index.value, 0,
//                     FontAwesomeIcons.calendarAlt),
//                 bottomNavigationOne(
//                     homeController.index.value, 1, FontAwesomeIcons.calendar),
//                 bottomNavigationOne(
//                     homeController.index.value, 2, FontAwesomeIcons.home),
//                 bottomNavigationOne(homeController.index.value, 3,
//                     FontAwesomeIcons.userGraduate),
//                 bottomNavigationOne(homeController.index.value, 4,
//                     FontAwesomeIcons.commentDots),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   BottomNavigationBarItem bottomNavigationOne(
//       int selectedIndex, index, IconData iconData) {
//     return BottomNavigationBarItem(
//         icon: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: index == selectedIndex
//                   ? kPrimaryColor
//                   : homeController.isChatPage.value
//                       ? kWhiteColor
//                       : kLightestGreyColor.withOpacity(.4),
//             ),
//             child: FaIcon(
//               iconData,
//               color: index == selectedIndex ? kWhiteColor : kPrimaryColor,
//               size: index == selectedIndex ? 30 : 25,
//             )),
//         label: '');
//   }
// }
