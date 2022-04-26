import 'package:certificate_pass/pages/resource/pages/imitated_test_page.dart';
import 'package:certificate_pass/pages/resource/pages/resource_search_page.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:fluro/fluro.dart';

class ResourceRouter implements IRouterProvider {
  static String searchPage = '/resource/search';
  static String imitatedTestPage = '/resource/imitated_test';

  @override
  void initRouter(FluroRouter router) {
    router.define(searchPage,
        handler: Handler(handlerFunc: (_, __) => ResourceSearchPage()));
    router.define(imitatedTestPage,
        handler: Handler(handlerFunc: (_, __) => ImitatedTestPage()));
  }
}
