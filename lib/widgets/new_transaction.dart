import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

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
              print(titleController.text);
              print(amountController.text);
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
