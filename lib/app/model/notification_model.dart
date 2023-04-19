import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/enums/notification_type.dart';

class NotificationModel {
  String senderImage;
  String senderName;
  NotificationType notificationType;
  String? likePostImage;
  NotificationModel({
    required this.senderImage,
    required this.senderName,
    required this.notificationType,
    this.likePostImage,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
    senderImage: 'https://randomuser.me/api/portraits/men/81.jpg',
    senderName: 'Shameel Irtaza',
    notificationType: NotificationType.follow,
  ),
  NotificationModel(
    senderImage: 'https://randomuser.me/api/portraits/men/81.jpg',
    likePostImage: AppAssets.kFeed,
    senderName: 'Shameel Irtaza',
    notificationType: NotificationType.liked,
  ),
];
