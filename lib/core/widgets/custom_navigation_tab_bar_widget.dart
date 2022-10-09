import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';

import '../../resources/resources.dart';

class CustomNavigationTabBarWidget extends StatelessWidget {
  const CustomNavigationTabBarWidget({
    Key? key,
    required this.onCreateGameTapped,
    required this.onMenuTapped,
    required this.onSearchTapped,
  }) : super(key: key);

  final VoidCallback onCreateGameTapped;
  final VoidCallback onMenuTapped;
  final VoidCallback onSearchTapped;

  static const double _height = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        children: [
          CustomPaint(
            painter: _NavigationBarPainter(),
            size: const Size(double.infinity, _height),
          ),
          // ЦЕНТРАЛЬНАЯ КНОПКА
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              onPressed: onCreateGameTapped,
              backgroundColor: AppColors.main,
              child: const Icon(
                Icons.add_rounded,
                color: AppColors.mainTextColor,
                size: 35,
              ),
            ),
          ),

          SizedBox(
            height: _height - 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ЛЕВАЯ КНОПКА
                IconButton(
                    onPressed: onMenuTapped,
                    icon: Image.asset(AppImages.snackBarIc)),

                const SizedBox(width: 50),
                // ПРАВАЯ КНОПКА
                IconButton(
                  onPressed: onSearchTapped,
                  icon: Image.asset(AppImages.searchIc),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.appBar;
    final path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
