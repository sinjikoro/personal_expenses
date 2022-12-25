import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height *
            0.6, //デバイスにあったheight取得を次セッションで行う
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (context, constraints) {
                  return Column(children: [
                    Text(
                      'No transacitons added yet!',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ]);
                },
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton(
                            onPressed: () => deleteTx(transactions[index].id),
                            child: SizedBox(
                              // これでよいかよくわからん
                              width: 80,
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.delete),
                                  Text('DELETE'),
                                ],
                              ),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.delete,
                            ),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ));
                }));
  }
}
