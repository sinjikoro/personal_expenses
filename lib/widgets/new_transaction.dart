import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            onSubmitted: (_) => _submitData(),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked date : ${DateFormat.yMd().format(_selectedDate ?? DateTime.now())}'),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  child: const Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text('Add Transaction'),
          )
        ]),
      ),
    );
  }
}
