import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned(top: 70, left: 20, child: _ButtonBack()),
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
                  onPressed: () {},
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
          onPressed: () {},
        ),
      ),
    );
  }
}
