import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return cardComponent(context, pair);
  }
}

Widget cardComponent(BuildContext context, WordPair word) {
  var theme = Theme.of(context);
  var style = theme.textTheme.displayMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
  );
  return Card(
    color: theme.colorScheme.primary,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        // Make sure that the compound word wraps correctly when the window
        // is too narrow.
        child: MergeSemantics(
          child: Wrap(
            children: [
              Text(
                word.first,
                style: style.copyWith(fontWeight: FontWeight.w200),
              ),
              Text(
                word.second,
                style: style.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
