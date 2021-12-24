import 'package:digicoach/src/common/constants/asset_image_link.dart';

class DashboardInformation {
  final String title;
  final String icon;
  final double value;

  DashboardInformation({
    required this.title,
    required this.icon,
    required this.value,
  });
}

final List<DashboardInformation> dashboardInfo = [
  DashboardInformation(
      title: "Cours effectués", icon: IconAsset.course, value: 42),
  DashboardInformation(title: "Note", icon: IconAsset.note, value: 3.5),
  DashboardInformation(title: "Badges", icon: IconAsset.badges, value: 8),
  DashboardInformation(
      title: "Commentaires", icon: IconAsset.comment, value: 12),
];
