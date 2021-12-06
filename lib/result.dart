import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 10) {
      resultText = 'You are awesome';
    } else if (resultScore <= 20) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 27) {
      resultText = 'You are someway bi.';
    } else {
      resultText = 'You spoil too much.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
