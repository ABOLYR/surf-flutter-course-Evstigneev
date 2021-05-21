import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/components/bottom_navigation_bar.dart';
import 'package:places/ui/components/tab_bar_indicator.dart';
import 'package:places/ui/components/visiting_sight_card.dart';

class VisitingScreen extends State with SingleTickerProviderStateMixin {
  TabController tabController;
  List tabs = [
    "Хочу посетить",
    "Посетил",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Избранное',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            height: 40,
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).unselectedWidgetColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for(int i = 0; i < tabController.length; i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      tabController.index = i;
                    });
                  },
                    child: TabBarIndicator(tabController, selected: (tabController.index == i) ? true : false, label: tabs[i],)
                )
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        VisitingSightCard(mocks[0], 'Закрыто до 9:00', 'Запланировано на 16 апр. 2021'),
                        VisitingSightCard(mocks[1], 'Закрыто до 10:00', 'Запланировано на 20 апр. 2021'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        VisitingSightCard(mocks[2], 'Закрыто до 10:00', 'Цель достигнута 14 апр. 2021', visited: true,),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      bottomNavigationBar: BottomNavBar(),
    );
  }
  
}