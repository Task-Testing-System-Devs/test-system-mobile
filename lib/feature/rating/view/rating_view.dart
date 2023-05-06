import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/rating/model/rating_model.dart';
import 'package:hse_lyc_code_test_system/feature/rating/presenter/rating_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/rating/widget/rating_card.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _ratingPresenter = RatingPresenter();
  final _sharedPreferencesService = SharedPreferencesService();

  final tabs = <Tab>[
    const Tab(
      text: 'По оценкам',
    ),
    const Tab(
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
          Future? ratingFuture;
          if (tab.text == 'По оценкам') {
            ratingFuture = _ratingPresenter.getRatingByMarks(_sharedPreferencesService.token);
          } else if (tab.text == 'По задачам') {
            ratingFuture = _ratingPresenter.getRatingByTasksAmount(_sharedPreferencesService.token);
          }

          return FutureBuilder(
            future: ratingFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print(snapshot.data);
                final data = snapshot.data as List<dynamic>;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return StudentRatingCard(
                      place: index + 1,
                      ratingModel: data[index],
                    );
                  },
                );
              }
              return const Center(
                child: Text('Ошибка'),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
