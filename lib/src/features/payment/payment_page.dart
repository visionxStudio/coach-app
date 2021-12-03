import 'dart:math';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicoach/app_localization.dart';
import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:digicoach/src/features/payment/bloc/payment_controller.dart';
import 'package:digicoach/src/features/payment/widgets/payment_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentBottomSheet extends ConsumerStatefulWidget {
  const PaymentBottomSheet({Key? key}) : super(key: key);

  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends ConsumerState<PaymentBottomSheet> {
  final GlobalKey _widgetKey = GlobalKey();
  double height = 300;
  bool _showFrontSide = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(_getWidgetInfo);
  }

  void _getWidgetInfo(_) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    _widgetKey.currentContext?.size;

    height = renderBox.size.height;
    setState(() {});
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = ref.watch(paymentControllerProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height - 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeightWidget(8.0),
              Center(
                child: Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: kLightGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.router.pop();
                    },
                    splashColor: kWhiteColor,
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
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
                  const Spacer(),
                  NormalText(
                    AppLocalizations.of(context)
                        .translate('payment_bottom_sheet.add_payment'),
                    isBold: true,
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),

              const HeightWidget(50.0),

              // Card UI
              GestureDetector(
                onTap: _switchCard,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder: __transitionBuilder,
                  layoutBuilder: (widget, list) =>
                      Stack(children: [widget!, ...list]),
                  switchInCurve: Curves.easeInBack,
                  switchOutCurve: Curves.easeInBack.flipped,
                  child: _showFrontSide
                      ? _buildFrontCardUI(context)
                      : _buildBackCardUI(context),
                ),
              ),
              const HeightWidget(50.0),

              // Add Card UI
              Consumer(
                builder: (BuildContext context, WidgetRef ref, child) {
                  return paymentProvider.isAddingCard
                      ? Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: PaymentCustomTextField(
                                    hintText: "Your Card Number",
                                    textInputType: TextInputType.number,
                                    maxLength: 16,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: PaymentCustomTextField(
                                    hintText: "Full Name",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: PaymentCustomTextField(
                                    hintText: "Date d’expiration",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: PaymentCustomTextField(
                                    hintText: "Code de sécurité",
                                  ),
                                ),
                              ],
                            ),
                            const HeightWidget(30.0),
                            InkWell(
                              onTap: () async {},
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0, 0.5, 1],
                                    colors: [
                                      Color(0xff0052D4),
                                      Color(0xff65C7F7),
                                      Color(0xff9CECFB),
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sauvegarder",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            paymentProvider.toggleIsAddingCard(value: true);
                          },
                          child: AnimatedContainer(
                            // height: 200.0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                            height: height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kLightGrey.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add),
                                const HeightWidget(8.0),
                                NormalText(
                                  AppLocalizations.of(context).translate(
                                      'payment_bottom_sheet.add_card'),
                                  isBold: true,
                                )
                              ],
                            ),
                          ),
                        );
                },
              ),
              const HeightWidget(50.0),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer _buildBackCardUI(BuildContext context) {
    return AnimatedContainer(
      // height: 200.0,
      duration: const Duration(milliseconds: 200),

      curve: Curves.ease,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 18),
            blurRadius: 80.0,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.08,
            ),
          ),
          BoxShadow(
            offset: const Offset(0, 4.02),
            blurRadius: 17.87,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.0477,
            ),
          ),
          BoxShadow(
            offset: const Offset(0, 1.2),
            blurRadius: 5.32,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.0323,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff000000).withOpacity(0.13),
                  const Color(0xff000000).withOpacity(0.06),
                  const Color(0xff000000).withOpacity(0.1),
                ],
              ),
            ),
          ),
          const HeightWidget(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: kLightGrey.withOpacity(0.05),
                  ),
                ),
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: kLightGrey.withOpacity(0.05),
                  ),
                  child: const Center(child: NormalText("234")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildFrontCardUI(BuildContext context) {
    return Container(
      key: _widgetKey,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 18),
            blurRadius: 80.0,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.08,
            ),
          ),
          BoxShadow(
            offset: const Offset(0, 4.02),
            blurRadius: 17.87,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.0477,
            ),
          ),
          BoxShadow(
            offset: const Offset(0, 1.2),
            blurRadius: 5.32,
            spreadRadius: 0,
            color: kPureBlack.withOpacity(
              0.0323,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      ImageAsset.mastercard,
                      height: 30.0,
                    ),
                  ],
                ),
                NormalText(
                  AppLocalizations.of(context)
                      .translate('payment_bottom_sheet.delete'),
                  isBold: true,
                )
              ],
            ),
          ),
          const HeightWidget(50.0),
          NormalText(
            AppLocalizations.of(context)
                .translate('payment_bottom_sheet.card_number_placeholder'),
            isBold: true,
            fontSize: 22.0,
          ),
          MediaQuery.of(context).size.height < 700
              ? const HeightWidget(30.0)
              : const HeightWidget(16.0),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    AppLocalizations.of(context)
                        .translate('payment_bottom_sheet.owner'),
                    color: kLightGreyColor,
                    fontSize: 16.0,
                  ),
                  const HeightWidget(8.0),
                  NormalText(
                    AppLocalizations.of(context)
                        .translate('payment_bottom_sheet.owner_placeholder'),
                    color: kLightGrey.withOpacity(0.6),
                    fontSize: 16.0,
                    isBold: true,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    AppLocalizations.of(context)
                        .translate('payment_bottom_sheet.expires'),
                    color: kLightGreyColor,
                    fontSize: 16.0,
                  ),
                  const HeightWidget(8.0),
                  NormalText(
                    AppLocalizations.of(context).translate(
                        'payment_bottom_sheet.expiry_date_placeholder'),
                    color: kLightGrey.withOpacity(0.6),
                    fontSize: 16.0,
                    isBold: true,
                  ),
                ],
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
          const HeightWidget(16.0),
        ],
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          // transform: _flipXAxis
          //     ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
          //     : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}
