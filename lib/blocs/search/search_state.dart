part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isDisplayedManualMarked;

  const SearchState({this.isDisplayedManualMarked = false});

  SearchState copyWith({bool? isDisplayedManualMarked}) => SearchState(
      isDisplayedManualMarked:
          isDisplayedManualMarked ?? this.isDisplayedManualMarked);

  @override
  List<Object> get props => [isDisplayedManualMarked];
}
