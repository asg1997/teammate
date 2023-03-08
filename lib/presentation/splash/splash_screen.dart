// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/presentation/auth/auth_status_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStatusCubit, AuthStatus>(
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
              _buildDot(animation.value, 0),
              const SizedBox(width: 8),
              _buildDot(animation.value, 1),
              const SizedBox(width: 8),
              _buildDot(animation.value, 2),
              const SizedBox(width: 8),
              _buildDot(animation.value, 3),
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
