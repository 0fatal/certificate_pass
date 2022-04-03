import 'package:certificate_pass/pages/index/pages/certificate_detail.dart';
import 'package:certificate_pass/pages/index/pages/search_page.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:fluro/fluro.dart';

class IndexRouter implements IRouterProvider {
  static String searchPage = '/search';
  static String certificateDetail = '/certificate_detail';
  @override
  void initRouter(FluroRouter router) {
    router.define(searchPage,
        handler: Handler(handlerFunc: (_, __) => SearchPage()));
    router.define(certificateDetail,
        handler: Handler(handlerFunc: (_, __) => CertificateDetail()));
  }
}
