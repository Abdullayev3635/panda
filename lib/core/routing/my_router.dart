import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/access_location_page.dart';
import '../../features/auth/presentation/pages/choose_region_page.dart';
import '../../features/auth/presentation/pages/select_language_page.dart';
import '../../utils/constants.dart';

class Routing {
  static final Routing _instance = Routing._internal();

  static Routing get instance => _instance;

  factory Routing() {
    return _instance;
  }

  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final shellNavigatorKey = GlobalKey<StatefulNavigationShellState>();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  static late final GoRouter router;

  Routing._internal() {
    final routes = <RouteBase>[
      // StatefulShellRoute.indexedStack(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   key: shellNavigatorKey,
      //   pageBuilder: (context, state, navigationShell) {
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       transitionDuration: Duration(milliseconds: 100),
      //       reverseTransitionDuration: Duration(milliseconds: 100),
      //       child: MainPage(navigationShell: navigationShell),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         const begin = Offset(1, 0);
      //         const end = Offset.zero;
      //         final tween = Tween(begin: begin, end: end);
      //         final offsetAnimation = animation.drive(tween);
      //         return SlideTransition(position: offsetAnimation, child: child);
      //       },
      //     );
      //   },
      //   branches: [
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: Constants.home,
      //           builder: (BuildContext context, GoRouterState state) {
      //             return const HomePage();
      //           },
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: Constants.contract,
      //           builder: (BuildContext context, GoRouterState state) {
      //             return ContractPage();
      //           },
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: Constants.course,
      //           builder: (BuildContext context, GoRouterState state) {
      //             return const CoursePage();
      //           },
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       routes: [
      //         GoRoute(
      //           path: Constants.profile,
      //           builder: (BuildContext context, GoRouterState state) {
      //             return const ProfilePage();
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Constants.selectLanguage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 100),
            reverseTransitionDuration: Duration(milliseconds: 100),
            child: SelectLanguage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Constants.chooseRegion,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 100),
            reverseTransitionDuration: Duration(milliseconds: 100),
            child: ChooseRegionPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Constants.accessToLocation,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 100),
            reverseTransitionDuration: Duration(milliseconds: 100),
            child: AccessLocationPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
    ];
    router = GoRouter(
      initialLocation: Constants.selectLanguage,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      restorationScopeId: 'root',
      routes: routes,
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: SizedBox());
      },
    );
  }
}
