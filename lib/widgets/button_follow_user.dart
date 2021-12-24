import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas_app/blocs/blocs.dart';

class ButtonFollowUser extends StatelessWidget {
  const ButtonFollowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {mapBloc.add(OnStartFollowingUserEvent());},
                icon: Icon(
                  state.isFollowingUser
                      ? Icons.directions_run
                      : Icons.hail_rounded,
                  color: Colors.black,
                ));
          },
        ),
      ),
    );
  }
}
