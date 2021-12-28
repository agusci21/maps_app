import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas_app/blocs/blocs.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => state.isDisplayedManualMarked
          ? const _ManualMarkerBody()
          : const SizedBox(),
    );
  }
}

class _ManualMarkerBody extends StatelessWidget {
  const _ManualMarkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned(top: 30, left: 20, child: _ButtonBack()),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -22),
              child: BounceInDown(
                from: 110,
                child: const Icon(
                  Icons.location_on_sharp,
                  size: 50,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 40,
              left: 40,
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: MaterialButton(
                  shape: const StadiumBorder(),
                  height: 50,
                  elevation: 0,
                  color: Colors.black,
                  onPressed: () async {
                    //TODO Loading
                    final start = locationBloc.state.lastKnownLocation;
                    final end = mapBloc.mapCenter;
                    if (start == null || end == null) return;
                    final destination =
                        await searchBloc.getCoorsStartToEnd(start, end);
                    mapBloc.drawRoutePolyline(destination);
                  },
                  minWidth: size.width - 120,
                  child: const Text(
                    'Confirmar Destino',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _ButtonBack extends StatelessWidget {
  const _ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 500),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            final searchBloc = BlocProvider.of<SearchBloc>(context);
            searchBloc.add(OnDesactivateManualMarkerEvent());
          },
        ),
      ),
    );
  }
}
