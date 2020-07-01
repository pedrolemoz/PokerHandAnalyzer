import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/tabs/clubs_tab.dart';
import 'package:poker_hand_analyzer/tabs/diamonds_tab.dart';
import 'package:poker_hand_analyzer/tabs/hearts_tab.dart';
import 'package:poker_hand_analyzer/tabs/spades_tab.dart';

class CardsTabs extends StatefulWidget {
  @override
  _CardsTabsState createState() => _CardsTabsState();
}

class _CardsTabsState extends State<CardsTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        labelColor: Theme.of(context).primaryColor,
        labelStyle: Theme.of(context).textTheme.headline6,
        unselectedLabelColor: Color(0xFF5E6163),
        indicatorColor: Theme.of(context).primaryColor,
        labelPadding: EdgeInsets.all(10.0),
        isScrollable: true,
        tabs: [
          Text('Ouros'),
          Text('Copas'),
          Text('Paus'),
          Text('Espadas'),
        ],
      ),
      body: TabBarView(
        children: [
          DiamondsTab(),
          HeartsTab(),
          ClubsTab(),
          SpadesTab(),
        ],
        controller: _tabController,
      ),
    );
  }
}
