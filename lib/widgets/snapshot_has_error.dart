import 'package:flutter/material.dart';

class SnapshotHasError extends StatelessWidget {
  const SnapshotHasError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Oops! Error\n   Try later',
            style: TextStyle(
                fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold)));
  }
}
