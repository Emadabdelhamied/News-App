import 'package:bloc/bloc.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/businessScreen.dart';
import 'package:news_app/modules/scienceScreen.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/modules/sportScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cacheHelper.dart';
import 'package:news_app/shared/network/remote/helper.dart';

import '../component/constants.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<FluidNavBarIcon> navBarIcons = [
    FluidNavBarIcon(
        icon: Icons.business,
        extras: {"label": "Business"},
        backgroundColor: barBackgroundColor),
    FluidNavBarIcon(
        icon: Icons.science,
        extras: {"label": "Science"},
        backgroundColor: barBackgroundColor),
    FluidNavBarIcon(
        icon: Icons.sports_baseball_rounded,
        extras: {"label": "Sports"},
        backgroundColor: barBackgroundColor),
  ];
  List<Widget> screens = [
    businessPage(),
    SciencePage(),
    SportPage(),
  ];
  void changeNavBar(int index) {
    currentIndex = index;
    emit(NewsChangeNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinesLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '28a1f44ff40143c591cf9b8942ab177d'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinesSucessState());
    }).catchError((error) {
      emit(NewsGetBusinesErrorState(error: error));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '28a1f44ff40143c591cf9b8942ab177d'
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSucessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error: error));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '28a1f44ff40143c591cf9b8942ab177d'
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSucessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error: error));
    });
  }

  bool isDark = false;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeState());
      });
    }
  }

  List<dynamic> search=[];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search=[];
    DioHelper.getData(url: 'v2/everything', quary: {
      'q': '$value',
      'apiKey': '28a1f44ff40143c591cf9b8942ab177d'
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSucessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error: error));
    });
  }

}
