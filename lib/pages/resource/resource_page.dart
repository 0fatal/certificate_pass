import 'package:certificate_pass/pages/resource/providers/resource_provider.dart';
import 'package:certificate_pass/pages/resource/resource_router.dart';
import 'package:certificate_pass/pages/resource/widgets/empty_exam.dart';
import 'package:certificate_pass/pages/resource/widgets/exam_resource.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourcePage extends StatefulWidget {
  ResourcePage({Key? key}) : super(key: key);

  @override
  _ResourcePageState createState() {
    return _ResourcePageState();
  }
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (_) => provider,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(children: [_buildHeader(), _buildBody()]))));
  }

  List<String> examList = ['大学英语四级'];
  ResourceProvider provider = ResourceProvider();

  Widget _buildHeader() {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.black,
                ),
                onTap: () =>
                    NavigatorUtils.push(context, ResourceRouter.searchPage),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('资料', style: TextStyles.textBold26),
              Consumer<ResourceProvider>(
                  builder: (_, provider, __) => DropdownButton<String>(
                        hint: Text('未添加'),
                        items: [
                          for (String examName in examList)
                            DropdownMenuItem(
                                child: Text(examName), value: examName)
                        ],
                        value: provider.currentExam,
                        onChanged: (obj) {
                          provider.update(currentExam: obj);
                        },
                        borderRadius: BorderRadius.circular(1),
                      ))
            ],
          )
        ],
      ),
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    );
  }

  Widget _buildBody() {
    return Consumer<ResourceProvider>(
      builder: (_, provider, __) =>
          provider.currentExam == null ? EmptyExam() : ExamResource(),
    );
  }
}
