import 'package:certificate_pass/pages/login/pages/area_select_page.dart';
import 'package:certificate_pass/pages/login/pages/identity_select_page.dart';
import 'package:certificate_pass/pages/login/pages/license_page.dart';
import 'package:certificate_pass/pages/login/pages/register_page.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';

class LoginRouter implements IRouterProvider {
  static String areaSelectPage = '/login/area_select';
  static String identitySelectPage = '/login/identity_select';
  static String licensePage = '/login/license';
  static String registerPage = '/login/register';

  @override
  void initRouter(FluroRouter router) {
    router.define(areaSelectPage,
        handler: Handler(handlerFunc: (_, __) => AreaSelectPage()));
    router.define(identitySelectPage,
        handler: Handler(handlerFunc: (_, __) => IdentitySelectPage()));
    router.define(licensePage,
        handler: Handler(handlerFunc: (_, __) => LicensePage()));
    router.define(registerPage,
        handler: Handler(handlerFunc: (_, __) => RegisterPage()));
  }
}
