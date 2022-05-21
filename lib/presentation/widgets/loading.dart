import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Alignment alignment;

  const Loading({Key? key, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: const SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }
}