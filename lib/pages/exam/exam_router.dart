import 'package:certificate_pass/pages/exam/pages/calendar_page.dart';
import 'package:certificate_pass/pages/exam/pages/count_down_page.dart';
import 'package:certificate_pass/pages/exam/pages/memo_detail_Page.dart';
import 'package:certificate_pass/pages/exam/pages/memo_page.dart';
import 'package:certificate_pass/routes/i_router.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';

class ExamRouter implements IRouterProvider {
  static String calendarPage = '/exam/calendar';
  static String countdownPage = '/exam/countdown_page';
  static String memoPage = '/exam/memo';
  static String memoDetailPage = '/exam/memo/detail';
  
  @override
  void initRouter(FluroRouter router) {
    router.define(calendarPage, handler: Handler(handlerFunc: (_,__) => CalendarPage()));
    router.define(countdownPage, handler: Handler(handlerFunc: (_,__) => CountDownPage()));
    router.define(memoPage, handler: Handler(handlerFunc: (_,__) => MemoPage()));
    router.define(memoDetailPage, handler: Handler(handlerFunc: (_,__) => MemoDetailPage()));
  }
}
