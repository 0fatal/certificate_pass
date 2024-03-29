import 'package:certificate_pass/pages/community/community_page.dart';
import 'package:certificate_pass/pages/exam/exam_page.dart';
import 'package:certificate_pass/pages/home/provider.dart';
import 'package:certificate_pass/pages/index/index_page.dart';
import 'package:certificate_pass/pages/profile/profile_page.dart';
import 'package:certificate_pass/pages/resource/resource_page.dart';
import 'package:certificate_pass/resources/colors.dart';
import 'package:certificate_pass/resources/dimens.dart';
import 'package:certificate_pass/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key, this.curPage}) : super(key: key);

  String? curPage;

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with RestorationMixin {
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void initData() {
    _pageList = [
      const IndexPage(),
      ResourcePage(),
      ExamPage(),
      CommunityPage(),
      ProfilePage(),
    ];
    if (widget.curPage != null) {
      int index = ['index', 'resource', 'exam', 'community', 'profile']
          .indexOf(widget.curPage!);
      provider = HomeProvider(index);
      _pageController = PageController(initialPage: index);
    } else {
      provider = HomeProvider(0);
      _pageController = PageController();
    }
  }

  late PageController _pageController;
  late HomeProvider provider;
  late List<Widget> _pageList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (_) => provider,
        child: Scaffold(
          bottomNavigationBar: Consumer<HomeProvider>(
              builder: (_, provider, __) => BottomNavigationBar(
                    backgroundColor: context.backgroundColor,
                    items: _buildBottomNavigationBarItems(),
                    currentIndex: provider.value,
                    elevation: 5.0,
                    iconSize: 21.0,
                    selectedFontSize: Dimens.font_sp10,
                    type: BottomNavigationBarType.fixed,
                    unselectedFontSize: Dimens.font_sp10,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Colours.unselected_item_color,
                    onTap: (int index) {
                      _pageController.jumpToPage(index);
                    },
                  )),
          body: PageView(
              controller: _pageController,
              children: _pageList,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                provider.value = index;
              }),
        ));
  }

  List<BottomNavigationBarItem>? _list;
  static const double _imageSize = 25.0;
  final List<String> _appBarTitles = ['首页', '资料', '备考', '社区', '个人'];

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    if (_list == null) {
      const tabImages = [
        [Icons.home_outlined, Icons.home],
        [
          Icons.all_inbox_sharp,
          Icons.all_inbox_sharp,
        ],
        [
          Icons.book_outlined,
          Icons.book,
        ],
        [
          Icons.comment,
          Icons.comment,
        ],
        [
          Icons.person,
          Icons.person,
        ]
      ];

      _list = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
            icon: Icon(tabImages[i][0]),
            activeIcon: Icon(tabImages[i][1]),
            label: _appBarTitles[i]);
      });
    }
    return _list!;
  }

  @override
  String? get restorationId => 'home';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
