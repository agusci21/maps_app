import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<OnActivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(isDisplayedManualMarked: true)));

        on<OnDesactivateManualMarkerEvent>(
        (event, emit) => emit(state.copyWith(isDisplayedManualMarked: false)));
  }
}
