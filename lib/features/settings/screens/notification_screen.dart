import 'package:flutter/material.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      image: "assets/images/chat_profile1.png",
      title: "sent you a partner request",
      sender: "Bob",
      type: NotificationType.request,
    ),
    NotificationItem(
      image: "assets/images/chat_profile1.png",
      title: "sent you a Reminder",
      sender: "Bob",
      type: NotificationType.info,
    ),
  ];

  void handleConfirm(int index) {
    setState(() {
      notifications[index].status = NotificationStatus.confirmed;
    });
  }

  void handleDelete(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: BackButton(color: Colors.black54),
          elevation: 0,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Column(
              children: [
                _NotificationCard(
                  item: item,
                  onConfirm: () => handleConfirm(index),
                  onDelete: () => handleDelete(index),
                ),
                Gap.h12,
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onConfirm;
  final VoidCallback? onDelete;

  const _NotificationCard({required this.item, this.onConfirm, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final showActions =
        item.type == NotificationType.request &&
        item.status == NotificationStatus.pending;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 25, backgroundImage: AssetImage(item.image)),
          Gap.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "${item.sender} ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: item.title,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                if (item.status == NotificationStatus.confirmed)
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Confirmed",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (showActions) Gap.h12,
                if (showActions)
                  Row(
                    children: [
                      SizedBox(
                        width: 130,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: onConfirm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[100],
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Text("Confirm"),
                        ),
                      ),
                      Gap.w12,
                      SizedBox(
                        width: 130,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: onDelete,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black54,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Text("Delete"),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum NotificationType { request, info }

enum NotificationStatus { pending, confirmed }

class NotificationItem {
  final String image;
  final String title;
  final String sender;
  final NotificationType type;
  NotificationStatus status;

  NotificationItem({
    required this.image,
    required this.title,
    required this.sender,
    required this.type,
    this.status = NotificationStatus.pending,
  });
}