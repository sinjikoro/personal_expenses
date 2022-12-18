import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          TextButton(
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            },
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple)),
            child: const Text('Add Transaction'),
          )
        ]),
      ),
    );
  }
}
