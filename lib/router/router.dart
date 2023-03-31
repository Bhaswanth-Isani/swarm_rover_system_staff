import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swarm_rover_system_staff/auth/auth.dart';
import 'package:swarm_rover_system_staff/dashboard/dashboard.dart';
import 'package:swarm_rover_system_staff/dashboard/presentation/order_page.dart';

part 'router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<CreateAccountRoute>(path: '/create-account')
class CreateAccountRoute extends GoRouteData {
  const CreateAccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateAccountPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<DashboardRoute>(
  path: '/',
  routes: [TypedGoRoute<OrderRoute>(path: 'order')],
)
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

class OrderRoute extends GoRouteData {
  const OrderRoute({this.index = 2});

  final int index;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      OrderPage(index: index);
}
