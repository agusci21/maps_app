import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
//Android
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Por favor, Espere'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Calculando Ruta'),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.black,
                  )
                ],
              ),
            ));
  } else if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) => const CupertinoAlertDialog(
              title: Text('Por favor, Espere'),
              content: CupertinoActivityIndicator(),
            ));
  }
  return;
}
