// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../models/transaction.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;

//   const TransactionList({super.key, required this.transactions});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 400,
//         child: transactions.isEmpty
//             ? Column(
//                 children: [
//                   Text(
//                     'No transactions added yet',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(height: 200,
//                     child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover))
//                 ],
//               )
//             : ListView.builder(
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                       child: Row(
//                     children: [
//                       Container(
//                         width: 100,
//                         padding: const EdgeInsets.all(10),
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).primaryColor,
//                                 width: 2)),
//                         child: Text(
//                           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(transactions[index].title,
//                               style: Theme.of(context).textTheme.titleLarge),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             style: const TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       )
//                     ],
//                   ));
//                 },
//                 itemCount: transactions.length,
//               ));
//   }
// }
