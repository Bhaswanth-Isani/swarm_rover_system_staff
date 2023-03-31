import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_staff/auth/auth.dart';
import 'package:swarm_rover_system_staff/router/router.dart';
import 'package:swarm_rover_system_staff/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      routes: $appRoutes,
      debugLogDiagnostics: true,
      initialLocation: const DashboardRoute().location,
      redirect: (context, state) {
        final authState =
            ref.watch(authControllerProvider.select((value) => value.admin));

        log(state.subloc);

        return authState == null
            ? state.location == const LoginRoute().location ||
                    state.location == const SplashRoute().location
                ? const LoginRoute().location
                : const CreateAccountRoute().location
            : null;
      },
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Patrio',
      theme: PatrioLightTheme().theme(),
      darkTheme: PatrioDarkTheme().theme(),
      routerConfig: router,
    );
  }
}
