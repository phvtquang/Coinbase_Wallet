import 'package:flutter/material.dart';

class RecoveryWordWithLeadingNumber extends StatelessWidget {
  const RecoveryWordWithLeadingNumber({
    Key? key,
    required this.leadingNumber,
    required this.word,
  }) : super(key: key);

  final int leadingNumber;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Text(leadingNumber.toString()),
          const Text(' '),
          Text(
            word,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
