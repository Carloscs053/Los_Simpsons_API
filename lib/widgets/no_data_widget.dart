import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Todavía no hay datos. Pulsa el botón',
            style: TextStyle(fontSize: 20),
          ),
          Icon(Icons.arrow_circle_down_outlined, size: 40),
        ],
      ),
    );
  }
}
