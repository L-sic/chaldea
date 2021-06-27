import 'package:chaldea/components/components.dart';
import 'package:chaldea/modules/item/item_detail_page.dart';
import 'package:chaldea/modules/shared/item_related_builder.dart';

import 'statistics_servant_tab.dart';

class GameStatisticsPage extends StatefulWidget {
  @override
  _GameStatisticsPageState createState() => _GameStatisticsPageState();
}

class _GameStatisticsPageState extends State<GameStatisticsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, int>? allItemCost;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(S.of(context).statistics_title),
        actions: [],
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(text: S.of(context).item),
          Tab(text: S.of(context).servant)
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        // pie chart relate
        physics: AppInfo.isMobile ? NeverScrollableScrollPhysics() : null,
        children: [
          // [PrimaryScrollerController]
          KeepAliveBuilder(builder: (context) => _buildItemTab()),
          KeepAliveBuilder(builder: (context) => StatisticServantTab())
        ],
      ),
    );
  }

  bool includeCurItems = false;

  Widget _buildItemTab() {
    calculateItem();
    final shownItems =
        sumDict([allItemCost, if (includeCurItems) db.curUser.items]);
    shownItems.removeWhere((key, value) {
      int group = (db.gameData.items[key]?.id ?? 0) ~/ 100;
      return key != Items.qp && (!(group >= 10 && group < 40) || value <= 0);
    });
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 12),
      children: [
        CheckboxListTile(
          value: includeCurItems,
          onChanged: (v) => setState(() {
            if (v != null) includeCurItems = v;
          }),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(S.of(context).statistics_include_checkbox),
        ),
        CustomTile(
          leading: db.getIconImage(Items.qp, height: kGridIconSize),
          title: Text(formatNumber(shownItems[Items.qp] ?? 0)),
          onTap: () => SplitRoute.push(
            context: context,
            builder: (context, _) => ItemDetailPage(itemKey: Items.qp),
          ),
        ),
        buildClassifiedItemList(
          context: context,
          data: shownItems..remove(Items.qp),
          divideRarity: false,
          crossCount: SplitRoute.isSplit(context) ? 7 : 7,
          onTap: (itemKey) => SplitRoute.push(
            context: context,
            builder: (context, _) => ItemDetailPage(itemKey: itemKey),
          ),
          compact: false,
        )
      ],
    );
  }

  void calculateItem() {
    if (allItemCost != null) return;
    allItemCost = {};
    final emptyPlan = ServantPlan(favorite: true);
    db.curUser.servants.forEach((no, svtStat) {
      if (!svtStat.favorite) return;
      if (!db.gameData.servantsWithUser.containsKey(no)) {
        print('No $no: ${db.gameData.servantsWithUser.length}');
        return;
      }
      final svt = db.gameData.servantsWithUser[no]!;
      sumDict(
        [allItemCost, svt.getAllCost(cur: emptyPlan, target: svtStat.curVal)],
        inPlace: true,
      );
    });
  }
}
