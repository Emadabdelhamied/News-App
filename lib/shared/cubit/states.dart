abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeNavState extends NewsStates {}

class NewsBusinesLoadingState extends NewsStates {}

class NewsGetBusinesSucessState extends NewsStates {}

class NewsGetBusinesErrorState extends NewsStates {
  final error;
  NewsGetBusinesErrorState({this.error});
}

class NewsSportsLoadingState extends NewsStates {}

class NewsGetSportsSucessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final error;
  NewsGetSportsErrorState({this.error});
}

class NewsScienceLoadingState extends NewsStates {}

class NewsGetScienceSucessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final error;
  NewsGetScienceErrorState({this.error});
}

class NewsChangeThemeState extends NewsStates {}

class NewsSearchLoadingState extends NewsStates {}

class NewsGetSearchSucessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final error;
  NewsGetSearchErrorState({this.error});
}