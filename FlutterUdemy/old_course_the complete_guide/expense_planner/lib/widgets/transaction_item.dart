import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTransaction,
  });

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _backgroundColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];

    _backgroundColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${widget.transaction.amount}'))),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                color: Colors.red),
      ),
    );
  }
}
