import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas_app/blocs/blocs.dart';
import 'package:mapas_app/delegates/delegates.dart';
import 'package:mapas_app/models/models.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.isDisplayedManualMarked
            ? const SizedBox()
            : const _SearchBarBody();
      },
    );
  }
}

class _SearchBarBody extends StatelessWidget {
  const _SearchBarBody({Key? key}) : super(key: key);

  void onSearchResult(BuildContext context, SearchResult result) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (result.isManual) {
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeInDown(
        duration: const Duration(milliseconds: 400),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: GestureDetector(
            onTap: () async {
              final result = await showSearch(
                  context: context, delegate: SearchDestinationDelegate());
              if (result == null) return;
              onSearchResult(context, result);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: const Text(
                '¿Donde quires Ir?',
                style: TextStyle(color: Colors.black87),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
