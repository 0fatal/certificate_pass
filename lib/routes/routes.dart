import 'package:certificate_pass/pages/home/home_page.dart';
import 'package:certificate_pass/pages/index/index_router.dart';
import 'package:certificate_pass/pages/profile/profile_router.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:certificate_pass/routes/not_found_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/home';
  static String profile = '/profile';
  static final List<IRouterProvider> _listRouter = [];
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext? context, Map<String, List<String>> params) =>
                    const Home()));

    _listRouter.add(IndexRouter());
    _listRouter.add(ProfileRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
