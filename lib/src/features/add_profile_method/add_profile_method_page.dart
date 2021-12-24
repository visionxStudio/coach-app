import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';

class AddProfileMethodPage extends StatelessWidget {
  const AddProfileMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            context.router.navigateBack();
          },
          color: kPrimaryColor,
        ),
        title: const NormalText(
          'add_payment_method_page.title',
          isBold: true,
          color: kPrimaryColor,
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightWidget(10),
            CardListWidget(
              label: "add_payment_method_page.applypay",
              card: IconAsset.applepay,
              ontap: () {},
            ),
            CardListWidget(
              label: "add_payment_method_page.strip",
              card: IconAsset.strip,
              ontap: () {},
            ),
            const Divider(),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding),
                child: const NormalText(
                  "add_payment_method_page.savedcard",
                  isBold: true,
                  fontSize: 14,
                )),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    background: slideLeftBackground(),
                    //secondaryBackground:
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        final bool res = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete $index ?"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      // setState(() {
                                      //   itemsList.removeAt(index);
                                      // });
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            });
                        return res;
                      }
                    },
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2,
                            horizontal: kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              IconAsset.strip,
                              height: 35,
                            ),
                            const WidthWidget(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                NormalText(
                                  "Joshua  Personnel",
                                  fontSize: 14,
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                HeightWidget(5),
                                NormalText(
                                  "**** **** **** 3582",
                                  fontSize: 12,
                                  color: kDarkGrey,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const HeightWidget(10),
            InkWell(
              onTap: () {
                context.router.push(const AddPaymentPageRoute());
              },
              child: Container(
                // alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding, horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.credit_card,
                      color: kCreditcardColor,
                    ),
                    WidthWidget(10),
                    NormalText(
                      "add_payment_method_page.addmap",
                      fontSize: 14,
                      color: kCreditcardColor,
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

//   Widget slideRightBackground() {
//   return Container(
//     color: Colors.green,
//     child: Align(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Icon(
//             Icons.edit,
//             color: Colors.white,
//           ),
//           Text(
//             " Edit",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ],
//       ),
//       alignment: Alignment.centerLeft,
//     ),
//   );
// }
  Widget slideLeftBackground() {
    return Container(
      alignment: Alignment.centerRight,
      color: const Color(0xFFE83D3D),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        child: Icon(
          Icons.delete_forever_outlined,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}

class CardListWidget extends StatelessWidget {
  final String card;
  final String label;
  final VoidCallback? ontap;
  const CardListWidget({
    Key? key,
    required this.card,
    required this.label,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        // alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding, horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(card),
            const WidthWidget(10),
            NormalText(
              label,
              fontSize: 14,
              color: kPrimaryColor,
              isBold: true,
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
