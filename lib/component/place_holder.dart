import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;

  EmptyPlaceholder({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Opacity(
              child: Image.asset("assets/images/empty.png"),
              opacity: 0.9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$message',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
