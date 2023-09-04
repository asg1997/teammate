import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/feachers/auth/presentation/nickname_page.dart';
import 'package:teammate/feachers/launch/providers/configure_app_proivder.dart';
import 'package:teammate/feachers/tabbar/tabbar_page.dart';

class LaunchPage extends ConsumerStatefulWidget {
  const LaunchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LaunchPageState();
}

class _LaunchPageState extends ConsumerState<LaunchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(appConfigProvider.notifier).configureApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(appConfigProvider);
    return status.when(
      loading: () => const Scaffold(body: LoadingWidget()),
      loggedIn: TabbarPage.new,
      loggedOut: NicknamePage.new,
    );
  }
}
