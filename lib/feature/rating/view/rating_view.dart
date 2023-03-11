import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final tabs = <Tab>[
    Tab(
      text: 'По оценкам',
    ),
    Tab(
      text: 'По задачам',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
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
        title: Text('Рейтинг'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) {
          return Center(
            child: Text(tab.text!),
          );
        }).toList(),
      ),
    );
  }
}
