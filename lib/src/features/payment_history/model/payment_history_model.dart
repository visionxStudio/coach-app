class PaymentHistoryModel {
  final String title;
  final String date;
  final double amount;

  PaymentHistoryModel(
      {required this.title, required this.date, required this.amount});
}

final List<PaymentHistoryModel> paymentHistory = [
  PaymentHistoryModel(amount: 2500, date: "20/04/2021", title: "Pierre Hadont"),
  PaymentHistoryModel(amount: 3200, date: "17/04/2021", title: "Cedint rent"),
  PaymentHistoryModel(amount: 3500, date: "21/04/2021", title: "Cedint rent"),
  PaymentHistoryModel(amount: 2500, date: "19/05/2021", title: "Cedint rent"),
  PaymentHistoryModel(amount: 2000, date: "20/04/2021", title: "Pierre Hadont"),
  PaymentHistoryModel(amount: 4000, date: "20/04/2021", title: "Cedint rent"),
];
