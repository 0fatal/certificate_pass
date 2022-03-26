import 'package:certificate_pass/routes/i_router.dart';
import 'package:certificate_pass/routes/not_found_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/home';
  static final List<IRouterProvider> _listRouter = [];
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String> params) => const Home();
    ));

//_listRouter.add(LoginRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
    routerProvider.initRouter(router);
    }
    _listRouter.forEach(initRouter);


  }
}
