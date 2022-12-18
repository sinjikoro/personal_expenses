import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            padding: const EdgeInsets.all(10),
            child: Text(
              '\$${tx.amount}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                tx.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(tx.date),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ]),
      );
    }).toList());
  }
}
