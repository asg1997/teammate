import 'package:flutter/material.dart';
import 'package:teammate/data/notifications_repo.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  final notificationRepo = NotificationRepo();
  bool? pushEnabled;

  String get _pushStr {
    if (pushEnabled == null) return '';
    return pushEnabled! ? 'Отключить уведомления' : 'Включить уведомления';
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _togglePush() {
    if (pushEnabled == null) return;
    notificationRepo.toggle();
    pushEnabled = !pushEnabled!;
    setState(() {});
  }

  void _init() async {
    pushEnabled = await notificationRepo.isNotificationsEnabled;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: _togglePush,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text(_pushStr, style: const TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
