import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    debugPrint('testPrint');
    debugPrint(enteredTitle);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

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
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: amountController,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            onPressed: submitData,
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
