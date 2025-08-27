import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.showSplashImage
            ? Builder(
                builder: (context) => Container(
                  color: FlutterFlowTheme.of(context).tertiary,
                  child: Image.asset(
                    'assets/images/ChatGPT_Image_May_11,_2025,_08_39_30_AM.png',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : entryPage ?? MainMenuWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).tertiary,
                    child: Image.asset(
                      'assets/images/ChatGPT_Image_May_11,_2025,_08_39_30_AM.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : entryPage ?? MainMenuWidget(),
        ),
        FFRoute(
          name: MainMenuWidget.routeName,
          path: MainMenuWidget.routePath,
          builder: (context, params) => MainMenuWidget(),
        ),
        FFRoute(
          name: Cclevel1Widget.routeName,
          path: Cclevel1Widget.routePath,
          builder: (context, params) => Cclevel1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CaesercipherlevelWidget.routeName,
          path: CaesercipherlevelWidget.routePath,
          builder: (context, params) => CaesercipherlevelWidget(),
        ),
        FFRoute(
          name: CategoriesPagesWidget.routeName,
          path: CategoriesPagesWidget.routePath,
          builder: (context, params) => CategoriesPagesWidget(),
        ),
        FFRoute(
          name: InfoWidget.routeName,
          path: InfoWidget.routePath,
          builder: (context, params) => InfoWidget(),
        ),
        FFRoute(
          name: AtbashCipherLevelWidget.routeName,
          path: AtbashCipherLevelWidget.routePath,
          builder: (context, params) => AtbashCipherLevelWidget(),
        ),
        FFRoute(
          name: VIGENEREcipherlevelWidget.routeName,
          path: VIGENEREcipherlevelWidget.routePath,
          builder: (context, params) => VIGENEREcipherlevelWidget(),
        ),
        FFRoute(
          name: ConfettiWinnerPagecc1Widget.routeName,
          path: ConfettiWinnerPagecc1Widget.routePath,
          builder: (context, params) => ConfettiWinnerPagecc1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Atbashlevel1Widget.routeName,
          path: Atbashlevel1Widget.routePath,
          builder: (context, params) => Atbashlevel1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Cclevel2Widget.routeName,
          path: Cclevel2Widget.routePath,
          builder: (context, params) => Cclevel2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageab1Widget.routeName,
          path: ConfettiWinnerPageab1Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageab1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Cclevel3Widget.routeName,
          path: Cclevel3Widget.routePath,
          builder: (context, params) => Cclevel3Widget(),
        ),
        FFRoute(
          name: Cclevel4Widget.routeName,
          path: Cclevel4Widget.routePath,
          builder: (context, params) => Cclevel4Widget(),
        ),
        FFRoute(
          name: Cclevel5Widget.routeName,
          path: Cclevel5Widget.routePath,
          builder: (context, params) => Cclevel5Widget(),
        ),
        FFRoute(
          name: Atbashlevel2Widget.routeName,
          path: Atbashlevel2Widget.routePath,
          builder: (context, params) => Atbashlevel2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Atbashlevel3Widget.routeName,
          path: Atbashlevel3Widget.routePath,
          builder: (context, params) => Atbashlevel3Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Atbashlevel4Widget.routeName,
          path: Atbashlevel4Widget.routePath,
          builder: (context, params) => Atbashlevel4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Atbashlevel5Widget.routeName,
          path: Atbashlevel5Widget.routePath,
          builder: (context, params) => Atbashlevel5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Vigenerelevel1Widget.routeName,
          path: Vigenerelevel1Widget.routePath,
          builder: (context, params) => Vigenerelevel1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Vigenerelevel2Widget.routeName,
          path: Vigenerelevel2Widget.routePath,
          builder: (context, params) => Vigenerelevel2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Vigenerelevel3Widget.routeName,
          path: Vigenerelevel3Widget.routePath,
          builder: (context, params) => Vigenerelevel3Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Vigenerelevel4Widget.routeName,
          path: Vigenerelevel4Widget.routePath,
          builder: (context, params) => Vigenerelevel4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Vigenerelevel5Widget.routeName,
          path: Vigenerelevel5Widget.routePath,
          builder: (context, params) => Vigenerelevel5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageV1Widget.routeName,
          path: ConfettiWinnerPageV1Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageV1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageCC5Widget.routeName,
          path: ConfettiWinnerPageCC5Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageCC5Widget(),
        ),
        FFRoute(
          name: ConfettiWinnerPageCC4Widget.routeName,
          path: ConfettiWinnerPageCC4Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageCC4Widget(),
        ),
        FFRoute(
          name: ConfettiWinnerPageCC3Widget.routeName,
          path: ConfettiWinnerPageCC3Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageCC3Widget(),
        ),
        FFRoute(
          name: ConfettiWinnerPageaCC2Widget.routeName,
          path: ConfettiWinnerPageaCC2Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageaCC2Widget(),
        ),
        FFRoute(
          name: ConfettiWinnerPageab5Widget.routeName,
          path: ConfettiWinnerPageab5Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageab5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageab4Widget.routeName,
          path: ConfettiWinnerPageab4Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageab4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageab3Widget.routeName,
          path: ConfettiWinnerPageab3Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageab3Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageab2Widget.routeName,
          path: ConfettiWinnerPageab2Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageab2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageV3Widget.routeName,
          path: ConfettiWinnerPageV3Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageV3Widget(),
        ),
        FFRoute(
          name: ConfettiWinnerPageV5Widget.routeName,
          path: ConfettiWinnerPageV5Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageV5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageV4Widget.routeName,
          path: ConfettiWinnerPageV4Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageV4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageV2Widget.routeName,
          path: ConfettiWinnerPageV2Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageV2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Morsecode4Widget.routeName,
          path: Morsecode4Widget.routePath,
          builder: (context, params) => Morsecode4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Morsecode5Widget.routeName,
          path: Morsecode5Widget.routePath,
          builder: (context, params) => Morsecode5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Morsecode3Widget.routeName,
          path: Morsecode3Widget.routePath,
          builder: (context, params) => Morsecode3Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.String,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Morsecode2Widget.routeName,
          path: Morsecode2Widget.routePath,
          builder: (context, params) => Morsecode2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: Morsecode1Widget.routeName,
          path: Morsecode1Widget.routePath,
          builder: (context, params) => Morsecode1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
            currentLevel: params.getParam(
              'currentLevel',
              ParamType.int,
            ),
            currentQuestion: params.getParam(
              'currentQuestion',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageMC1Widget.routeName,
          path: ConfettiWinnerPageMC1Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageMC1Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageMC2Widget.routeName,
          path: ConfettiWinnerPageMC2Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageMC2Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageMC3Widget.routeName,
          path: ConfettiWinnerPageMC3Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageMC3Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageMC4Widget.routeName,
          path: ConfettiWinnerPageMC4Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageMC4Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ConfettiWinnerPageMC5Widget.routeName,
          path: ConfettiWinnerPageMC5Widget.routePath,
          builder: (context, params) => ConfettiWinnerPageMC5Widget(
            correctOption: params.getParam(
              'correctOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MsCipherlevelWidget.routeName,
          path: MsCipherlevelWidget.routePath,
          builder: (context, params) => MsCipherlevelWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
