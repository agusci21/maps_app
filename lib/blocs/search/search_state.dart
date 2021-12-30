part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isDisplayedManualMarked;
  final List<Feature> places;
  final List<Feature> history;
  const SearchState(
      {this.isDisplayedManualMarked = false,
      this.places = const [],
      this.history = const []});

  SearchState copyWith(
          {bool? isDisplayedManualMarked,
          List<Feature>? places,
          final List<Feature>? history}) =>
      SearchState(
          isDisplayedManualMarked:
              isDisplayedManualMarked ?? this.isDisplayedManualMarked,
          places: places ?? this.places,
          history: history ?? this.history);

  @override
  List<Object> get props => [isDisplayedManualMarked, places, history];
}
