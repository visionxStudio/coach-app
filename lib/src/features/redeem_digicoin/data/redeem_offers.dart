class RedeemOffersModel {
  final String title;
  final String offer;
  final int? percentage;
  final int? reductionAmount;

  RedeemOffersModel({
    required this.title,
    required this.offer,
    this.percentage,
    this.reductionAmount,
  });
}

final List<RedeemOffersModel> redeemLists = [
  RedeemOffersModel(
    title: "Réduction (10 points)",
    offer: "redeem_page.five_point",
    percentage: 5,
  ),
  RedeemOffersModel(
    title: "Réduction (15 points)",
    offer: "redeem_page.fifteen_point",
    percentage: 10,
  ),
  RedeemOffersModel(
    title: "Réduction (30 points)",
    offer: "redeem_page.thirty_point",
    reductionAmount: 20,
  ),
  RedeemOffersModel(
    title: "Réduction (45 points)",
    offer: "redeem_page.fourtyfive_point",
    reductionAmount: 40,
  ),
];
