import 'package:certificate_pass/pages/profile/pages/developer_page.dart';
import 'package:certificate_pass/pages/profile/pages/profile_info_page.dart';
import 'package:certificate_pass/pages/profile/pages/setting_page.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';

class ProfileRouter implements IRouterProvider {
  static String profileInfo = '/profile/info';
  static String settings = '/profile/settings';
  static String developer = '/developer';
  @override
  void initRouter(FluroRouter router) {
    router.define(profileInfo,
        handler: Handler(handlerFunc: (_, __) => ProfileInfoPage()));
    router.define(settings,
        handler: Handler(handlerFunc: (_, __) => SettingPage()));
    router.define(developer,
        handler: Handler(handlerFunc: (_, __) => DeveloperPage()));
    // TODO: implement initRouter
  }
}
