import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/presentation/auth/auth_provider.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );
    final animation = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(animationController),
    );

    useEffect(
      () {
        animationController.repeat();
        return null;
      },
      [],
    );

    return BlocListener<AuthProviderCubit, AuthStatus>(
      listener: (context, status) {
        if (status == AuthStatus.isAuth) {
          navigatorKey.currentState?.pushReplacementNamed(AppRoutes.main);
        } else if (status == AuthStatus.isNotRegistered) {
          navigatorKey.currentState
              ?.pushReplacementNamed(AppRoutes.registrationInfo);
        } else if (status == AuthStatus.isNotAuth) {
          navigatorKey.currentState?.pushReplacementNamed(AppRoutes.auth);
        }
      },
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(animation, 0),
              const SizedBox(width: 8),
              _buildDot(animation, 1),
              const SizedBox(width: 8),
              _buildDot(animation, 2),
              const SizedBox(width: 8),
              _buildDot(animation, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(double animationValue, int index) {
    final waveFactor = sin(animationValue * pi + index * pi / 3);
    final dotSize = 8.0 + waveFactor * 4.0;

    return AnimatedBuilder(
      animation: AlwaysStoppedAnimation(animationValue),
      builder: (context, child) => Transform.scale(
        scale: dotSize / 12,
        child: child,
      ),
      child: Container(
        width: dotSize,
        height: dotSize,
        decoration: const BoxDecoration(
          color: AppColors.main,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
