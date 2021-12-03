import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/features/booking/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookProvider = ref.watch(bookingProvider);
    return Scaffold(
        backgroundColor:
            bookProvider.bookingActivePageIndex == 0 ? kSecondaryColor : null,
        body: SafeArea(
          child: Column(
            children: [
              ProgressBarWidget(bookProvider),
              Expanded(
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: bookProvider.bookingList.length,
                  onPageChanged: (int page) {
                    bookProvider.changeBookingPage(page);
                  },
                  controller: bookProvider.bookingPageController,
                  itemBuilder: (context, index) {
                    return bookProvider.bookingList[index];
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget(
    this.bookProvider, {
    Key? key,
  }) : super(key: key);
  final BookingProvider bookProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height(50),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context.router.navigateBack();
              },
              icon: Icon(
                Icons.keyboard_backspace,
                color: bookProvider.bookingActivePageIndex == 0
                    ? kWhiteColor
                    : kBlackColor,
              )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: kDefaultFontSize - 8,
                  backgroundColor: kIndicatorColor3,
                  child: CircleAvatar(
                    backgroundColor: bookProvider.bookingActivePageIndex == 0
                        ? kWhiteColor
                        : kIndicatorColor3,
                    radius: kDefaultFontSize - 10,
                    child: const CircleAvatar(
                      backgroundColor: kIndicatorColor3,
                      radius: kDefaultFontSize - 12,
                    ),
                  ),
                ),
                SizedBox(
                    width: width(100),
                    child: Divider(
                      thickness: 8,
                      color: bookProvider.bookingActivePageIndex == 0
                          ? kWhiteColor
                          : kPrimaryColor,
                    )),
                CircleAvatar(
                  radius: kDefaultFontSize - 8,
                  backgroundColor: bookProvider.bookingActivePageIndex == 0
                      ? kWhiteColor
                      : kIndicatorColor3,
                  child: CircleAvatar(
                    backgroundColor: bookProvider.bookingActivePageIndex == 0
                        ? kWhiteColor
                        : bookProvider.bookingActivePageIndex == 1
                            ? kWhiteColor
                            : kIndicatorColor3,
                    radius: kDefaultFontSize - 10,
                    child: CircleAvatar(
                      backgroundColor: bookProvider.bookingActivePageIndex == 0
                          ? kWhiteColor
                          : kIndicatorColor3,
                      radius: kDefaultFontSize - 12,
                    ),
                  ),
                ),
                SizedBox(
                    width: width(100),
                    child: Divider(
                      thickness: 8,
                      color: bookProvider.bookingActivePageIndex == 0
                          ? kWhiteColor
                          : kPrimaryColor,
                    )),
                CircleAvatar(
                  radius: kDefaultFontSize - 8,
                  backgroundColor: bookProvider.bookingActivePageIndex == 0
                      ? kWhiteColor
                      : bookProvider.bookingActivePageIndex == 1
                          ? kPrimaryColor
                          : kIndicatorColor3,
                  child: CircleAvatar(
                    backgroundColor: bookProvider.bookingActivePageIndex == 0
                        ? kWhiteColor
                        : bookProvider.bookingActivePageIndex == 1
                            ? kPrimaryColor
                            : bookProvider.bookingActivePageIndex == 2
                                ? kWhiteColor
                                : kIndicatorColor3,
                    radius: kDefaultFontSize - 10,
                    child: CircleAvatar(
                      backgroundColor: bookProvider.bookingActivePageIndex == 0
                          ? kWhiteColor
                          : bookProvider.bookingActivePageIndex == 1
                              ? kPrimaryColor
                              : kIndicatorColor3,
                      radius: kDefaultFontSize - 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
