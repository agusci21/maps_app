part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isDisplayedManualMarked;
  final List<Feature> places;

  const SearchState({
    this.isDisplayedManualMarked = false,
    this.places = const [],
  });

  SearchState copyWith(
          {bool? isDisplayedManualMarked, List<Feature>? places}) =>
      SearchState(
          isDisplayedManualMarked:
              isDisplayedManualMarked ?? this.isDisplayedManualMarked,
          places: places ?? this.places);

  @override
  List<Object> get props => [isDisplayedManualMarked, places];
}
