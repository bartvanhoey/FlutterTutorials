import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTransaction,
  });

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                  child: Text('\$${transaction.amount}'))),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle:
            Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                
                onPressed: () =>
                    deleteTransaction(transaction.id),
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Delete', style: TextStyle(color: Colors.red),),
                )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () =>
                    deleteTransaction(transaction.id),
                color: Colors.red),
      ),
    );
  }
}
